PROG_EXEC=~/.opam/default/bin/hevea
#PROG_OPTS=-mathml
PROG_OPTS=
PROG=$(PROG_EXEC) $(PROG_OPTS)

.PHONY : all
all:	gotowce/test/test.html

gotowce/test/test.html: src/test/test.tex #src/test/test.htoc src/test/test.haux
#	eval $(opam env) # nie działa :(
	mkdir -p gotowce/test
	$(PROG) src/test/test.tex -o gotowce/test/test.html
	$(PROG) src/test/test.tex -o gotowce/test/test.html # 2 razy żeby odnośniki się ogarnęły

.PHONY : clean
clean:
	rm -rf gotowce/
