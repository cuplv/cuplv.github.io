HTML_OUTPUT = index.html news.html papers.html people.html $(wildcard papers/*.html)
OUTPUT = $(HTML_OUTPUT)
SAXON = java -jar bin/saxon8.jar
INCLUDE = pl.keys.xsl
DATA = pl.xml

all: html
bib: pl.bib
clean:
	rm -f $(OUTPUT) *.log

commit: html
	svn add $(HTML_OUTPUT)
	svn commit

html: $(HTML_OUTPUT)
$(HTML_OUTPUT): pl.html.log
%.log: %.xsl $(DATA)
	rm -f $(HTML_OUTPUT)
	$(SAXON) -o $@ -s $(DATA) $<
	chmod -w $(HTML_OUTPUT)

%.bib: %.bib.xsl $(DATA)
	$(SAXON) -o $@  -s $(DATA) $<
