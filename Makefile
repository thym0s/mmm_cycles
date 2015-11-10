MAIN = mmm
SOURCES = $(MAIN).tex $(MAIN).bib $(wildcard section*.tex)

$(MAIN).dvi: $(SOURCES)
	latex $(MAIN).tex
	bibtex $(MAIN) 
	latex $(MAIN).tex
	latex $(MAIN).tex

%.pdf: %.dvi
	dvipdf $<

%.ps: %.dvi
	dvips $<

ps: $(MAIN).ps
	evince $(MAIN).ps

pdf: $(MAIN).pdf
	evince $(MAIN).pdf

clean:
	rm -f *.aux *.log *.toc *.dvi *.pdf *.ps *.bbl *.blg

.PHONY:	clean ps pdf
