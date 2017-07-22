for year in {2013..2016}
do
	for pagenumber in {01460..01463}
	do
	   curl https://www.tweedekamer.nl/kamerstukken/stemmingsuitslagen/detail?id=${year}P${pagenumber} -o /Users/Vincent/Desktop/vote_analysis/download/webpages/${year}P${pagenumber}
	done
done
