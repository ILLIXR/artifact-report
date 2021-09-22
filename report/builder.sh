#!/bin/sh

source "${stdenv}/setup"
mkdir "${out}"
for file in "${src}/"*; do
	basename="$(basename ""${file}"")"
	if [ "${basename}" != "result" ] && [ "${basename}" != "main.pdf" ]; then
		cp "${file}" .
	fi
done

pdflatex -shell-escape main.tex
mv /build/main.pdf "${out}/main.pdf"
