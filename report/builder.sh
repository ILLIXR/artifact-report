#!/bin/sh

source "${stdenv}/setup"
mkdir "${out}"
for file in "${src}/"*; do
	basename="$(basename ""${file}"")"
	if [ "${basename}" != "result" ] && [ "${basename}" != "main.pdf" ]; then
		cp "${file}" .
	fi
done

pdflatex -shell-escape appendix.tex
cp /build/appendix.pdf "${out}/appendix.pdf"

pdftk A=uncombined.pdf B=appendix.pdf cat A1-10 B A11-end output main.pdf
mv /build/main.pdf "${out}/main.pdf"
