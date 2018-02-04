SHELL := /bin/bash

# specify your main target here:
all: misc.pdf clean

# specify the main file and all the files that you are including
SOURCE=misc.tex myMacros.tex \
	references.bib 

%.pdf: %.tex $(SOURCE)
	pdflatex $*
	bibtex $*
	pdflatex $*
	pdflatex $*

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.toc *.cut *.out *.tmp *.tpm *.adx *.adx.hyp *.idx *.ilg *.ind \
	*.and *.glg *.glo *.gls *.wdx *.wnd *.wrd *.wdv *.ldx *.lnd *.rdx *.rnd *.xdv 

realclean: clean
	rm -f *.dvi *.ps *.pdf

release_hausarbeit:
	cp templates/hausarbeit-template.tex .
	zip -r hausarbeit-template.zip hausarbeit-template.tex myMacros.tex references.bib settings/standard-settings.tex packages/*.sty examples/*.tex bst/biblatex-sp-unified/[^.]* 
	rm hausarbeit-template.tex


