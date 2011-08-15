HTML_OUTPUT = index.html news.html papers.html people.html
OUTPUT = $(HTML_OUTPUT)
SAXON = java -jar bin/saxon8.jar
INCLUDE = pl.keys.xsl
DATA = pl.xml

all: html
bib: pl.bib
clean:
	rm -f $(OUTPUT) *.log papers/*.html

commit: html
	svn add *.html
	svn add papers/*.html
	svn commit

html: $(HTML_OUTPUT)
$(HTML_OUTPUT): pl.html.log
%.log: %.xsl $(DATA)
	$(SAXON) -o $@ -s $(DATA) $<

%.bib: %.bib.xsl $(DATA)
	$(SAXON) -o $@  -s $(DATA) $<
