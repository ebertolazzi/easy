all:	clean latex html

clean:
	rm -rf easybib/docbib easybmat/docbmat easyeqn/doceqn easymat/docmat easytable/doctable easyvector/docvector
	rm -rf */*.dvi */*.ps */*.pdf */*.aux */*.toc */*.log */*.pdf

latex:
	cd easybib;    pdflatex docbib    ; pdflatex docbib    ; pdflatex docbib
	cd easybmat;   pdflatex docbmat   ; pdflatex docbmat   ; pdflatex docbmat
	cd easyeqn;    pdflatex doceqn    ; pdflatex doceqn    ; pdflatex doceqn
	cd easymat;    pdflatex docmat    ; pdflatex docmat    ; pdflatex docmat
	cd easytable;  pdflatex doctable  ; pdflatex doctable  ; pdflatex doctable
	cd easyvector; pdflatex docvector ; pdflatex docvector ; pdflatex docvector

html:
	cd easybib;    latex2html -local_icons -no_navigation -split 0 docbib
	cd easybmat;   latex2html -local_icons -no_navigation -split 0 docbmat
	cd easyeqn;    latex2html -local_icons -no_navigation -split 0 doceqn
	cd easymat;    latex2html -local_icons -no_navigation -split 0 docmat
	cd easytable;  latex2html -local_icons -no_navigation -split 0 doctable
	cd easyvector; latex2html -local_icons -no_navigation -split 0 docvector
	cp bk.jpg docbib
	cp bk.jpg docbmat
	cp bk.jpg doceqn
	cp bk.jpg docmat
	cp bk.jpg doctable
	cp bk.jpg docvector
	rm -f */images* */WARNINGS */labelas.pl *.sty *.perl

install:
	rm -rf ../../easy
	mkdir ../../easy
	mkdir ../../easy/doc.html
	mkdir ../../easy/doc.ps
	mkdir ../../easy/doc.pdf
	mkdir ../../easy/doc.dvi
	cp -r docbib    ../../easy/doc.html
	cp -r docbmat   ../../easy/doc.html
	cp -r doceqn    ../../easy/doc.html
	cp -r docmat    ../../easy/doc.html
	cp -r doctable  ../../easy/doc.html
	cp -r docvector ../../easy/doc.html
	cp *.ps  ../../easy/doc.ps
	cp *.pdf  ../../easy/doc.pdf
	cp *.dvi ../../easy/doc.dvi
