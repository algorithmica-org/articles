#!/bin/bash
cp -r src/img web/
mkdir -p web/{ru,en}
cd src
for file in `find {en,ru,tg} -iname "*.md" -type f`
do
    basename=`basename ${file%.md}`
    index="FALSE"  # TODO: swap true and false
    title=`grep -m1 -Po "^# *\K(.*)$" ${file}`
    if [ "$basename" != "index" ]; then
        title="${title} - Алгоритмика"
        index="TRUE"
    fi
    pandoc "${file}" \
    -o "../web/${file%.md}.html" \
    -H ../web/head.html \
    --css ../pandoc.css \
    --template ../web/template.html \
    --metadata title="$title" \
    --variable filename=$basename \
    --metadata index=$index \
    --standalone --mathjax
done
