# Helper scripts that runs plink functions from the associated docker image 
# Workflow is geared towards producing data ready for PCA and admixture analysis based on 1000 genomes dataset
# Original data is obtained through associated download script

PFILE="workpath/all_hg38"
WORKPATH=$( dirname $PFILE )

# Convert initial plink2 binary files into plink files
# also does some filtering and variant renaming steps to render compatible for other analyses
docker run --rm -v $PWD:$PWD plink plink2 --pfile $PWD/$PFILE vzs --make-bed --out $PWD/$WORKPATH/bed --max-alleles 2 --snps-only --set-all-var-ids @:#:\$r:\$a --allow-extra-chr

# Obtain list of variant in linkage disequilibrium for filtering out (no relevant information for PCA)
docker run --rm -v $PWD:$PWD plink plink --bfile $PWD/$WORKPATH/bed --indep-pairwise 50 5 0.2 --out $PWD/$WORKPATH/prune --allow-extra-chr

# Generate pruned dataset
docker run --rm -v $PWD:$PWD plink plink --bfile $PWD/$WORKPATH/bed --extract $PWD/$WORKPATH/prune.prune.in --make-bed --out $PWD/$WORKPATH/bed_prune --allow-extra-chr

