WORDCLOUD = java -jar ibm-word-cloud.jar -c word-cloud.conf
WORDS = $(wildcard *.words.txt)

all: $(WORDS:%.txt=%.png)
clean:
	rm -f $(WORDS:%.txt=%.png)

%.words.png: %.words.txt
	[ ! -e $@ ] || (git status $< | grep "modified" >/dev/null); \
	if [ $$? -eq 0 ]; then \
          $(WORDCLOUD) -w 400 -h 400 -i $< -o $*.cloud.png; \
	  convert -extent 400x400 -background "#CCCCCC" -gravity center \
            $*.cloud.png $*.flat.png; \
          rm -f $*.cloud.png; \
	  convert -raise 2 $*.flat.png $@; \
          rm -f $*.flat.png; \
        fi
