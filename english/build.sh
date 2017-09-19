#!/bin/sh -e

if [ `which pdflatex` ]; then
	echo "compiling using local pdflatex"
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main
else
	echo "compiling using docker: sotetsuk/pdflatex"
	docker run --rm -v `pwd`:/data sotetsuk/pdflatex pdflatex main
	docker run --rm -v `pwd`:/data sotetsuk/pdflatex bibtex main
	docker run --rm -v `pwd`:/data sotetsuk/pdflatex pdflatex main
	docker run --rm -v `pwd`:/data sotetsuk/pdflatex pdflatex main
fi
