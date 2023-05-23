Texts = $(shell find . -name '*.txt' -not -name 'index.txt')
Pages = $(Texts:%.txt=%.html)

all: index.html index.pdf $(Pages)

index.txt: $(Texts) includes.sh
	echo "= Linguistic of programming languages" > $@
	echo ":toc:" >> $@
	echo ":leveloffset: +1" >> $@
	echo >> $@
	./includes.sh $(Texts) >> $@
	echo >> $@
	echo ":leveloffset: -1" >> $@

%.html: %.txt
	asciidoc -b html5 $<

clean:
	rm *.html

.PHONY: clean
