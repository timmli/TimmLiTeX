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

HAUSARBEIT_FILES =  myMacros.tex references.bib \
	settings/standard-settings.tex \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/poster*), $(filter-out $(wildcard examples/beamer*), $(wildcard examples/*.tex))) \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

release_hausarbeit:
	cp templates/hausarbeit-template.tex .
	zip -r hausarbeit-template.zip hausarbeit-template.tex $(HAUSARBEIT_FILES) 
	rm hausarbeit-template.tex

ABSTRACT_FILES =  myMacros.tex references.bib \
	settings/standard-settings.tex \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/poster*), $(filter-out $(wildcard examples/beamer*), $(wildcard examples/*.tex))) \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

release_abstract:
	cp templates/abstract-template.tex .
	zip -r abstract-template.zip abstract-template.tex $(ABSTRACT_FILES) 
	rm abstract-template.tex

POSTER_FILES =  myMacros.tex references.bib \
	settings/myPosterstyle.tex \
	settings/poster-settings.tex \
	graphics/sfb-logo-quer.pdf \
	graphics/hhu-logo-hres.pdf \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/beamer*), $(wildcard examples/*.tex)) \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

release_poster:
	cp templates/poster-template.tex .
	zip -r poster-template.zip poster-template.tex $(POSTER_FILES) 
	rm poster-template.tex
