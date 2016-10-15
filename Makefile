#
SOURCE := main.tex
EDITOR := emacs
#
ALL    := $(wildcard *.tex *.sty)
PDF    := $(SOURCE:.tex=.pdf)
#
all: $(PDF)
#
%.pdf: %.tex
	pdflatex --shell-escape $< $@
	@echo $@ done.
#
refresh-bib:
	bibtex main
#
edit:
	$(EDITOR) $(SOURCE) $(ALL) &
#
clean:
	@rm -f *.ps *.dvi *.pdf *~ *.log *.aux *.toc *.out *.lof *.toc \#*\# *.bbl *.blg
