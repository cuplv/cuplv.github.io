HTML_OUTPUT = index.html news.html papers.html people.html projects.html $(wildcard papers/*.html)
WORDS_OUTPUT = $(wildcard clouds/*.words.txt) $(wildcard clouds/*.words.png)
OUTPUT = $(HTML_OUTPUT) $(WORDS_OUTPUT) $(wildcard papers/*.pdf) $(wildcard pics/*)
SAXON = java -jar bin/saxon8.jar
INCLUDE = pl.keys.xsl
DATA = pl.xml

all: html
bib: pl.bib
clean:
	rm -f $(HTML_OUTPUT) *.log
really-clean:
	make clean
	rm -f $(WORDS_OUTPUT)

commit: html
	git add $(OUTPUT); git commit -a

html: pl.html.log words

words: pl.words.txt.log
	cd clouds/; make

%.log: %.xsl $(DATA)
	$(SAXON) -o $@ -s $(DATA) $<

%.bib: %.bib.xsl $(DATA)
	$(SAXON) -o $@  -s $(DATA) $<
