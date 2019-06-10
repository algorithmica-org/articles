#!/bin/bash
set -x
cp -r src/img web/
mkdir -p web/{ru,en}
cd src
for file in `find {ru,en} -iname "*.md" -type f`
do
    pandoc "${file}" \
    -o "../web/${file%.md}.html" \
    -H ../web/head.html \
    --css ../pandoc.css \
    --metadata title="`grep -m1 -Po "^# *\K(.*)$" ${file}`" \
    --standalone --mathjax
done
