# Convert pruned dataset to pgen
docker run --rm -v $PWD:$PWD plink plink2 \
--bfile $PWD/workpath/bed_prune \
--make-pgen \
--out $PWD/$WORKPATH/pgen_prune \
--extract $PWD/resources/NBBR3377_pgen_prune_intersect.txt \
--allow-extra-chr

# Generate principle components 
mkdir -p $PWD/pcs
docker run --rm -v $PWD:$PWD plink plink2 \
--pfile $PWD/$WORKPATH/pgen_prune \
--freq counts \
--pca allele-wts \
--out $PWD/pcs/all_hg38 \
--allow-extra-chr \
--maf 0.05