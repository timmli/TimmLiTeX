SHELL := /bin/bash

BEAMER_FILES =  myMacros.tex references.bib \
	beamer-settings.tex \
	$(wildcard packages/*.sty) \
	beamer-examples.tex \
	$(wildcard bst/biblatex-sp-unified/[^.]*) \
	$(wildcard graphics/*.pdf) 

test_beamer:
	cp beamer-template.tex ..
	cp themes/beamer* ..
	cp latexmkrc ..
	cd ..; \
		latexmk -pdf beamer-template.tex

	# release_beamer:
	# 	cp templates/beamer-template.tex .
	# 	cp themes/beamer* .
	# 	zip -r template-beamer.zip beamer* $(BEAMER_FILES) 
	# 	rm beamer*
	# 	mv template-beamer.zip beamer-template.zip

	# clean_beamer:
	# 	rm beamer*
