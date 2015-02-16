# Makefile for LaTeX Documents

# Find the main latex files using technology
SOURCE := main.tex
# SOURCE := $(shell egrep -l '^[^%]*\\begin\{document\}' *.tex)
# SOURCE := $(shell egrep -l '^[^%]*\\begin\{document\}' *.tex | head -n 1)

ALL    := $(wildcard *.tex *.sty)
DVI    := $(SOURCE:.tex=.dvi)
PSF    := $(SOURCE:.tex=.ps)
PDF    := $(SOURCE:.tex=.pdf)

# Define rules for all source files.
# latex => dvi => ps => pdf

all: $(PDF)

%.dvi: $(SOURCE)
	@echo "TEX --> DVI"
	@latex $<

%.ps: %.dvi
	@echo "DVI --> PS"
	@dvips $< > /dev/null 2>&1

%.pdf: %.ps
	@echo "PS  --> PDF"
	@ps2pdf -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress $< $@ > /dev/null 2>&1
	@echo $@ done.

show:
	gv $(MAIN)

show-dvi:
	xdvi -watchfile 2 $(DVI)&

edit:   show-dvi
	$(EDITOR) $(SOURCE)

edit-all: show-dvi
	$(EDITOR) $(SOURCE) $(ALL)

clean:
	@rm -f *.ps *.dvi *.pdf *~ *.log *.aux *.toc
