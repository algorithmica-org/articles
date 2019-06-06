#!/bin/bash
cp -r src/img web/
mkdir -p web/{ru,en}
cd src 
find {ru,en} -iname "*.md" -type f -exec sh -c 'pandoc "${0}" ../web/metrica.html -o "../web/${0%.md}.html" --css ../pandoc.css --standalone --mathjax' {} \;
