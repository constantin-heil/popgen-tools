### Process a target vcf file by converting to pgen and projecting onto reference pcs
set -eu
ASSAYPREFIX="$1"

# Convert and preprocess a target vcf file
docker run --rm -v $PWD:$PWD plink plink2 --vcf $PWD/assay_data/${ASSAYPREFIX}.vcf.gz --make-pfile --out $PWD/assay_data/${ASSAYPREFIX} --allow-extra-chr --set-all-var-ids @:#:\$r:\$a --new-id-max-allele-len 300 

# Project the prepared assay file to pcs
docker run --rm -v $PWD:$PWD plink plink2 --pfile $PWD/assay_data/${ASSAYPREFIX} --read-freq $PWD/pcs/all_hg38.acount --score $PWD/pcs/all_hg38.eigenvec.allele 2 5 header-read no-mean-imputation variance-standardize --score-col-nums 6-15 --out $PWD/assay_data/${ASSAYPREFIX} --allow-extra-chr
