SHELL := /bin/bash

#-------------------------------------------------------------------------------

ABSCHLUSSARBEIT_TEST_DIR = test_abschlussarbeit
ABSCHLUSSARBEIT_FILES =  TLmacros.tex \
	text-settings.tex \
  muss.bbx \
  muss.cbx \
	$(wildcard packages/*.sty) \
	abschlussarbeit-examples.tex \
	abschlussarbeit-main.tex \
	references.bib

test_abschlussarbeit:
	rm -fr $(ABSCHLUSSARBEIT_TEST_DIR)
	mkdir $(ABSCHLUSSARBEIT_TEST_DIR)
	cp -r --parents $(ABSCHLUSSARBEIT_FILES) $(ABSCHLUSSARBEIT_TEST_DIR)
	cd $(ABSCHLUSSARBEIT_TEST_DIR); \
			latexmk -pdf abschlussarbeit-main.tex

release_abschlussarbeit:
	rm -fr temp
	mkdir temp
	cp -r --parents $(ABSCHLUSSARBEIT_FILES) temp
	cd temp; zip -r abschlussarbeit-template.zip *; mv abschlussarbeit-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

BEAMER_TEST_DIR = test_beamer
BEAMER_FILES =  TLmacros.tex \
	$(wildcard beamer*) \
	$(wildcard packages/*.sty) \
	$(wildcard graphics/*.pdf) \
	references.bib \
	latexmkrc \
	muss.bbx \
  muss.cbx

test_beamer:
	rm -fr $(BEAMER_TEST_DIR)
	mkdir $(BEAMER_TEST_DIR)
	cp -r --parents $(BEAMER_FILES) $(BEAMER_TEST_DIR)
	cd $(BEAMER_TEST_DIR); \
			latexmk -pdf beamer-main.tex

release_beamer:
	rm -fr temp
	mkdir temp
	cp -r --parents $(BEAMER_FILES) temp
	cd temp; zip -r beamer-template.zip *; mv beamer-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

HAUSARBEIT_TEST_DIR = test_hausarbeit
HAUSARBEIT_FILES =  TLmacros.tex \
	text-settings.tex \
	scrarticle-settings.tex \
  muss.bbx \
  muss.cbx \
	$(wildcard packages/*.sty) \
	hausarbeit-examples.tex  \
	references.bib \
  hausarbeit-main.tex

test_hausarbeit:
	rm -fr $(HAUSARBEIT_TEST_DIR)
	mkdir $(HAUSARBEIT_TEST_DIR)
	cp -r --parents $(HAUSARBEIT_FILES) $(HAUSARBEIT_TEST_DIR)
	cd $(HAUSARBEIT_TEST_DIR); \
			latexmk -pdf hausarbeit-main.tex

release_hausarbeit:
	rm -fr temp
	mkdir temp
	cp -r --parents $(HAUSARBEIT_FILES) temp
	cd temp; zip -r hausarbeit-template.zip *; mv hausarbeit-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

ABSTRACT_TEST_DIR = test_abstract
ABSTRACT_FILES =  TLmacros.tex \
	text-settings.tex \
	$(wildcard packages/*.sty) \
	abstract-main.tex \
	abstract-examples.tex \
  references.bib \
	latexmkrc \
  muss.bbx \
  muss.cbx

test_abstract:
	rm -fr $(ABSTRACT_TEST_DIR)
	mkdir $(ABSTRACT_TEST_DIR)
	cp -r --parents $(ABSTRACT_FILES) $(ABSTRACT_TEST_DIR)
	cd $(ABSTRACT_TEST_DIR); \
			latexmk -pdf abstract-main.tex

release_abstract:
	rm -fr temp
	mkdir temp
	cp -r --parents $(ABSTRACT_FILES) temp
	cd temp; zip -r abstract-template.zip *; mv abstract-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

ARTICLE_TEST_DIR = test_article
ARTICLE_FILES =  TLmacros.tex \
	text-settings.tex \
	scrarticle-settings.tex \
	$(wildcard packages/*.sty) \
	article-main.tex \
	article-examples.tex \
  references.bib \
	latexmkrc \
  muss.bbx \
  muss.cbx

test_article:
	rm -fr $(ARTICLE_TEST_DIR)
	mkdir $(ARTICLE_TEST_DIR)
	cp -r --parents $(ARTICLE_FILES) $(ARTICLE_TEST_DIR)
	cd $(ARTICLE_TEST_DIR); \
			latexmk -pdf article-main.tex

release_article:
	rm -fr temp
	mkdir temp
	cp -r --parents $(ARTICLE_FILES) temp
	cd temp; zip -r article-template.zip *; mv article-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

BOOK_TEST_DIR = test_book
BOOK_FILES =  TLmacros.tex \
	text-settings.tex \
	$(wildcard packages/*.sty) \
	book-main.tex  \
	book-examples.tex  \
  references.bib \
	latexmkrc \
  muss.bbx \
  muss.cbx

test_book:
	rm -fr $(BOOK_TEST_DIR)
	mkdir $(BOOK_TEST_DIR)
	cp -r --parents $(BOOK_FILES) $(BOOK_TEST_DIR)
	cd $(BOOK_TEST_DIR); \
			latexmk -pdf book-main.tex

release_book:
	rm -fr temp
	mkdir temp
	cp -r --parents $(BOOK_FILES) temp
	cd temp; zip -r book-template.zip *; mv book-template.zip ..
	rm -fr temp
