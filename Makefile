
pdf : dedication.tex acknowledgments.tex abstract.tex introduction.tex paper1.tex conclusion.tex appendix.tex
	pdflatex main.tex
	biber main
	pdflatex main.tex

abstract-page : abstract.tex
	pdflatex abstract-page.tex

dedication.tex : dedication.markdown
	pandoc dedication.markdown -o dedication.tex --biblatex

acknowledgments.tex : acknowledgments.markdown
	pandoc acknowledgments.markdown -o acknowledgments.tex --biblatex

abstract.tex : abstract.markdown
	pandoc abstract.markdown -o abstract.tex --biblatex

introduction.tex : introduction.markdown
	pandoc introduction.markdown -o introduction.tex --biblatex

paper1.tex : paper1.markdown
	pandoc paper1.markdown -o paper1.tex --biblatex

conclusion.tex : conclusion.markdown
	pandoc conclusion.markdown -o conclusion.tex --biblatex

appendix.tex : appendix.markdown
	pandoc appendix.markdown -o appendix.tex --biblatex

clean :
	rm *.aux *.bbl *.log *.lot *.run.xml *.tex.blg *.toc *.bcf *.blg *.lof
