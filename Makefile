PROG_EXEC=~/.opam/default/bin/hevea
#PROG_OPTS=-mathml
PROG_OPTS=
PROG=$(PROG_EXEC) $(PROG_OPTS)

.PHONY : all
all:	 test szescienna

.PHONY : test
test: gotowce/test/test.html

.PHONY : szescienna
szescienna: gotowce/szescienna/CzymJestKlej.html

gotowce/test/test.html: src/test/test.tex #src/test/test.htoc src/test/test.haux
#	eval $(opam env) # nie działa :(
	mkdir -p gotowce/test
	eval $(opam env) && $(PROG) src/test/test.tex -o gotowce/test/test.html
	eval $(opam env) && $(PROG) src/test/test.tex -o gotowce/test/test.html # 2 razy żeby odnośniki się ogarnęły

gotowce/szescienna/CzymJestKlej.html:
	mkdir -p gotowce/szescienna
	cd src/szescienna && agda --html --html-dir=../../gotowce/szescienna CzymJestKlej.agda


.PHONY : clean
clean:
	rm -rf gotowce/
