# Makefile for science-is-real graphic
# Author: Jonah Miller (jonah.maxwell.miller@gmail.com)

SCIENCE_IS_REAL = science-is-real-graphic.pdf\
		  science-is-real-graphic.png\
		  science-is-real-graphic-flat.png

WITH_LABELS = science-is-real-graphic-labels.pdf\
	      science-is-real-graphic-labels.png\
	      science-is-real-graphic-labels-flat.png

default: science-is-real-graphic
all: science-is-real-graphic science-is-real-graphic-labels
science-is-real-graphic: ${SCIENCE_IS_REAL}
science-is-real-graphic-labels: ${WITH_LABELS}

%.pdf: %.tex
	pdflatex $^

%.png: %.pdf
	convert $^ -quality 100 $@

%-flat.png: %.png
	convert $^ -flatten $@

science-is-real-graphic.png: science-is-real-graphic.pdf
science-is-real-graphic-flat.png: science-is-real-graphic.png
science-is-real-graphic.pdf: science-is-real-graphic.tex
science-is-real-graphic-labels.png: science-is-real-graphic-labels.pdf
science-is-real-graphic-labels-flat.png: science-is-real-graphic-labels-flat.png
science-is-real-graphic-labels.pdf: science-is-real-graphic-labels.tex

dummy: all default clean science-is-real-graphic

clean:
	$(RM) *.log
	$(RM) *.synctex.gz
	$(RM) *.aux
