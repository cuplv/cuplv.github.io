HTML_OUTPUT = index.html news.html papers.html
OUTPUT = $(HTML_OUTPUT)

INCLUDE = pl.keys.xsl
DATA = pl.xml

all: html
clean:
	rm -f $(OUTPUT) *.log papers/*.html

html: $(HTML_OUTPUT)
$(HTML_OUTPUT): pl.html.log
%.log: %.xsl $(DATA)
	saxon -o $@ -s $(DATA) $<

commit: html
	svn add *.html
	svn add papers/*.html
	svn commit
