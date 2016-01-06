# Produce sensys-abstract compliant PDFs from all Markdown files in a directory
# Manuel Moraga | mmoraga@kth.se

# List files to be made
PDFS := $(patsubst %.md,%.pdf,$(wildcard *.md))

all : $(PDFS)

# Accepts PDF target with markdown syntax, makes them using pandoc
%.pdf : %.md
		pandoc $< -o $@ --template=shortpaper.latex --filter pandoc-citeproc --csl=acm-sig-proceedings.csl

clean :
		rm $(PDFS)

rebuild: clean all
