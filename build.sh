#!/bin/bash
cp -r src/img web/
mkdir -p web/{ru,en}
cd src
find {ru,en} -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "../web/${0%.md}.html" -H ../web/head.html --css ../pandoc.css --metadata title="`grep -m1 -Po "^# *\K(.*)$" ${0}`" --standalone --mathjax' {} \;
