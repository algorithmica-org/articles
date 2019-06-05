#!/bin/bash
cp -r src/img web/
mkdir -p web/{ru,en}
#find src/{ru,en} -iname "*.md" -type f -exec sh -c 'echo "${0#src/}"' {} \;
cd src 
find {ru,en} -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "../web/${0%.md}.html" --css ../pandoc.css --standalone --mathjax' {} \;
