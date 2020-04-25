SHELL := /bin/bash

release_all: release_abstract release_article release_beamer release_book release_jlm release_langscibook release_poster release_standalone release_hausarbeit release_essay

release_abstract:
	cd templates/text-template; \
		make release_abstract; \
		mv abstract-template.zip ..

release_article:
	cd templates/text-template; \
		make release_article; \
		mv article-template.zip ..

release_beamer:
	cd templates/beamer-template; \
		make release_beamer; \
		mv beamer-template.zip ..

release_book:
	cd templates/text-template; \
		make release_book; \
		mv book-template.zip ..

release_jlm:
	cd templates/jlm-template; \
		make release_jlm; \
		mv jlm-template.zip ..

release_langscibook:
	cd templates/langscibook-template; \
		make release_langscibook; \
		mv langscibook-template.zip ..

release_poster:
	cd templates/poster-template; \
		make release_poster; \
		mv poster-template.zip ..

release_standalone:
	cd templates/standalone-template; \
		make release_standalone; \
		mv standalone-template.zip ..

release_hausarbeit:
	cd templates/teaching-template; \
		make release_hausarbeit; \
		mv hausarbeit-template.zip ..

release_essay:
	cd templates/teaching-template; \
		make release_essay; \
		mv essay-template.zip ..
