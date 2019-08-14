#!/bin/bash
cp -r src/{en,ru,tg}/img web/
mkdir -p web/{en,ru,tg}
cd src
for file in `find {en,ru,tg} -iname "*.md" -type f`
do
    section=${file:0:2}
    if [ "$section" = "ru" ]; then
        sitename="Алгоритмика"
    fi
    if [ "$section" = "en" ]; then
        sitename="Algorithmica"
    fi
    if [ "$section" = "tg" ]; then
        sitename="Tinkoff Generation"
    fi
    basename=`dirname ${file%.md}`
    index="FALSE"  # TODO: swap true and false
    title=`grep -m1 -Po "^# *\K(.*)$" ${file}`
    if [ "$basename" != "index" ]; then
        title="$title - $sitename"
        index="TRUE"
    fi
    pandoc "${file}" \
    -o "../web/${file%.md}.html" \
    -H ../web/head.html \
    --css ../pandoc.css \
    --template ../web/template.html \
    --metadata title="$title" \
    --variable filename="$basename" \
    --variable section="$section" \
    --variable sitename="$sitename" \
    --metadata index="$index" \
    --standalone --mathjax
done
