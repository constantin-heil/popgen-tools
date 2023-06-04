pcs: workpath/all_hg38.pgen workpath/all_hg38.pvar.zst workpath/all_hg38.psam
	bash get_pcs.sh

workpath/all_hg38.pgen workpath/all_hg38.pvar.zst workpath/all_hg38.psam &:
	bash download.sh

clean: 
	ls workpath | grep -v md$ | xargs -I {} rm -rf workpath/{}

