rm report.pdf
rm *.bbl
rm *.aux
pdflatex report
bibtex report
pdflatex report
pdflatex report
pdflatex report
rm report.aux  report.blg  report.dvi  report.log
open report.pdf
detex report.tex | wc -w
texcount report.tex
