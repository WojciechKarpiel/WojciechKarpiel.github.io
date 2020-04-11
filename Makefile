PROG_EXEC=hevea
PROG_OPTS=-mathml
PROG=$(PROG_EXEC) $(PROG_OPTS)

.PHONY : all
all:	gotowce/test/test.html gotowce/komputerowe-dowodzenie/0-wstep.html

gotowce/test/test.html: src/test/test.tex #src/test/test.htoc src/test/test.haux
	eval $$(opam env)
	mkdir -p gotowce/test
	eval $$(opam env) && $(PROG_EXEC) src/test/test.tex -o gotowce/test/test.html
	eval $$(opam env) && $(PROG_EXEC) src/test/test.tex -o gotowce/test/test.html # 2 razy żeby odnośniki się ogarnęły

gotowce/komputerowe-dowodzenie/0-wstep.html: src/komputerowe-dowodzenie/0-wstep.tex
	mkdir -p gotowce/komputerowe-dowodzenie
	eval $$(opam env) && $(PROG_EXEC) src/komputerowe-dowodzenie/0-wstep.tex -o gotowce/komputerowe-dowodzenie/0-wstep.html
	eval $$(opam env) && $(PROG_EXEC) src/komputerowe-dowodzenie/0-wstep.tex -o gotowce/komputerowe-dowodzenie/0-wstep.html


.PHONY : clean
clean:
	rm -rf gotowce/
