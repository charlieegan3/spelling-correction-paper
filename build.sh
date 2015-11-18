rm *.bbl
rm *.aux
pdflatex cs4040report
bibtex cs4040report
pdflatex cs4040report
pdflatex cs4040report
pdflatex cs4040report
rm cs4040report.aux  cs4040report.blg  cs4040report.dvi  cs4040report.log
open cs4040report.pdf
detex cs4040report.tex | wc -w
texcount cs4040report.tex
