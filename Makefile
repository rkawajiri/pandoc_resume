NAME=rkawajiri
HASH=$(shell git rev-parse --short HEAD)
TIMESTAMP=$(shell date +"%Y%m%d%H%M%S")

all: html pdf docx rtf

pdf: resume.pdf
resume.pdf: resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md; \
	context resume.tex

html: resume.html
resume.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o resume.html resume.md

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o resume.rtf

release: resume.pdf resume.docx resume.rtf resume.html
	cp resume.pdf ${NAME}-${TIMESTAMP}-${HASH}.pdf
	cp resume.docx ${NAME}-${TIMESTAMP}-${HASH}.docx
	cp resume.rtf ${NAME}-${TIMESTAMP}-${HASH}.rtf
	cp resume.html ${NAME}-${TIMESTAMP}-${HASH}.html

clean:
	rm -f resume.html
	rm -f resume.tex
	rm -f resume.tuc
	rm -f resume.log
	rm -f resume.pdf
	rm -f resume.docx
	rm -f resume.rtf
