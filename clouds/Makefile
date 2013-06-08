WORDCLOUD = java -jar ibm-word-cloud.jar -c word-cloud.conf
WORDS = $(wildcard *.words.txt)

all: $(WORDS:%.txt=%.png)
clean:
	rm -f $(WORDS:%.txt=%.png)

%.cloud.png:
	$(WORDCLOUD) -w 400 -h 400 -i $*.txt -o $@

%.flat.png: %.cloud.png
	convert -extent 400x400 -background "#CCCCCC" -gravity center $< $@

%.png: %.flat.png
	convert -raise 2 $< $@
