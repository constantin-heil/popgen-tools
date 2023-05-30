# from https://www.cog-genomics.org/plink/2.0/resources#phase3_1kg

curl -fSL "https://www.dropbox.com/s/j72j6uciq5zuzii/all_hg38.pgen.zst?dl=1" -o workpath/all_hg38.pgen.zst
curl -fSL "https://www.dropbox.com/s/vx09262b4k1kszy/all_hg38.pvar.zst?dl=1" -o workpath/all_hg38.pvar.zst
curl -fSL "https://www.dropbox.com/s/2e87z6nc4qexjjm/hg38_corrected.psam?dl=1" -o workpath/all_hg38.psam

# Decompress the pgen file, pvar file can be compressed for further analysis
docker run --rm -v $PWD:$PWD plink plink2 --zst-decompress $PWD/workpath/all_hg38.pgen.zst > $PWD/workpath/all_hg38.pgen


