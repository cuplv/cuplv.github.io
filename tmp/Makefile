HTML_OUTPUT = index.html news.html papers.html
OUTPUT = $(HTML_OUTPUT)
SAXON = saxon
INCLUDE = pl.keys.xsl
DATA = pl.xml

all: html
bib: pl.bib
clean:
	rm -f $(OUTPUT) *.log papers/*.html

html: $(HTML_OUTPUT)
$(HTML_OUTPUT): pl.html.log
%.log: %.xsl $(DATA)
	$(SAXON) -o $@ -s $(DATA) $<

%.bib: %.bib.xsl $(DATA)
	$(SAXON) -o $@  -s $(DATA) $<

%.txt: %.txt.xsl $(DATA)
	saxon -o $@ -s $(DATA) $<

%.abstract.txt.xsl: abstract.txt.xsl $(DATA)
	sed 's/ID/$*/g' $< >$@

commit: html
	svn add *.html
	svn add papers/*.html
	svn commit
