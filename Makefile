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

#-------------------------------------------------------------------------------

ABSTRACT_FILES =  myMacros.tex references.bib \
	settings/standard-settings.tex \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/poster*), $(filter-out $(wildcard examples/beamer*), $(wildcard examples/*.tex))) \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

test_abstract:
	cp templates/abstract-template.tex .
	latexmk -pdf abstract-template.tex

release_abstract:
	cp templates/abstract-template.tex .
	zip -r abstract-template.zip abstract-template.tex $(ABSTRACT_FILES) 
	rm abstract-template.tex

#-------------------------------------------------------------------------------

BEAMER_FILES =  myMacros.tex references.bib \
	settings/beamer-settings.tex \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/poster*), $(wildcard examples/*.tex)) \
	$(wildcard bst/biblatex-sp-unified/[^.]*) \
	graphics/sfb-logo-quer.pdf \
	graphics/hhu-logo-hres.pdf \
	graphics/MNF-logo.pdf \
	graphics/UT-logo.pdf 

test_beamer:
	cp templates/beamer-template.tex .
	cp themes/beamer* .
	latexmk -pdf beamer-template.tex

release_beamer:
	cp templates/beamer-template.tex .
	cp themes/beamer* .
	zip -r template-beamer.zip beamer* $(BEAMER_FILES) 
	rm beamer*
	mv template-beamer.zip beamer-template.zip

clean_beamer:
	rm beamer*

#-------------------------------------------------------------------------------

HAUSARBEIT_FILES =  myMacros.tex references.bib \
	settings/standard-settings.tex \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/poster*), $(filter-out $(wildcard examples/beamer*), $(wildcard examples/*.tex))) \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

release_hausarbeit:
	cp templates/hausarbeit-template.tex .
	zip -r hausarbeit-template.zip hausarbeit-template.tex $(HAUSARBEIT_FILES) 
	rm hausarbeit-template.tex

test_hausarbeit:
	cp templates/hausarbeit-template.tex .
	latexmk -pdf hausarbeit-template.tex

#-------------------------------------------------------------------------------

JLM_ARTICLE_FILES =  myMacros.tex references.bib \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/poster*), $(filter-out $(wildcard examples/beamer*), $(wildcard examples/*.tex)))

release_jlm_article:
	cp templates/jlm-article-template.org .
	cp templates/jlm/cc-by.pdf .
	cp templates/jlm/jlm.cls .
	cp templates/jlm/jlm.bst .
	cp templates/jlm/jlm-guidelines.pdf .
	cp templates/latexmkrc-xelatex latexmkrc
	cp -r templates/jlm/fonts .
	zip -r jlm-article-template.zip \
		jlm-article-template.org jlm.cls jlm.bst cc-by.pdf jlm-guidelines.pdf latexmkrc fonts $(JLM_ARTICLE_FILES) 
	rm -fr jlm-article-template.org jlm.cls jlm.bst cc-by.pdf jlm-guidelines.pdf fonts

test_jlm_article:
	cp templates/jlm-article-template.tex .
	cp templates/jlm/cc-by.pdf .
	cp templates/jlm/jlm.cls .
	cp templates/jlm/jlm.bst .
	cp templates/jlm/jlm-guidelines.pdf .
	cp templates/latexmkrc-xelatex latexmkrc
	latexmk -pdf hausarbeit-template.tex

clean_jlm_article:
	rm -fr jlm-article-template.org jlm.cls jlm.bst cc-by.pdf jlm-guidelines.pdf fonts

#-------------------------------------------------------------------------------

LANGSCI_PAPER_FILES =  myMacros.tex references.bib \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/poster*), $(filter-out $(wildcard examples/beamer*), $(wildcard examples/*.tex)))

release_langsci_paper:
	cp -r templates/langscibook/langsci .
	cp templates/langsci-paper-template.org .
	cp templates/langsci-paper-template.tex .
	cp templates/latexmkrc-xelatex latexmkrc
	zip -r langsci-paper-template.zip \
    langsci-paper-template.org langsci-paper-template.tex langsci $(LANGSCI_PAPER_FILES)
	rm -fr langsci langsci*

test_langsci_paper:
	cp -r templates/langscibook/langsci .
	cp templates/langsci-paper-template.tex .
	cp templates/latexmkrc-xelatex latexmkrc
	latexmk -pdf langsci-paper-template.tex

clean_langsci_paper:
	rm -fr langsci langsci*

#-------------------------------------------------------------------------------

POSTER_FILES =  myMacros.tex references.bib \
	settings/myPosterstyle.tex \
	settings/poster-settings.tex \
	graphics/sfb-logo-quer.pdf \
	graphics/hhu-logo-hres.pdf \
	$(wildcard packages/*.sty) \
	$(filter-out $(wildcard examples/beamer*), $(wildcard examples/*.tex)) \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

test_poster:
	cp templates/poster-template.tex .
	latexmk -pdf poster-template.tex

release_poster:
	cp templates/poster-template.tex .
	zip -r poster-template.zip poster-template.tex $(POSTER_FILES) 
	rm poster-template.tex

#-------------------------------------------------------------------------------

release_all: release_abstract release_beamer release_hausarbeit release_poster release_jlm_article release_langsci_paper

