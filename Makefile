clean: 
	ls workpath | grep -v md$ | xargs -I {} rm -f workpath/{}

