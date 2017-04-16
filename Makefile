all: science-is-real-graphic
default: science-is-real-graphic
science-is-real-graphic: science-is-real-graphic.pdf science-is-real-graphic.png

science-is-real-graphic.png: science-is-real-graphic.pdf
	convert $^ -quality 100 $@

science-is-real-graphic.pdf: science-is-real-graphic.tex
	pdflatex $^

dummy: all default clean science-is-real-graphic

clean:
	$(RM) science-is-real-graphic.log
	$(RM) science-is-real-graphic.synctex.gz
	$(RM) science-is-real-graphic.aux
