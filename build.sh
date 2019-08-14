#!/bin/bash
cp -r src/{en,ru,tg}/img web/
mkdir -p web/{en,ru,tg}
cd src
for file in `find {en,ru,tg} -iname "*.md" -type f`
do
    section=${file:0:2}
    edit="Редактировать"
    view_history="История"
    if [ "$section" = "ru" ]; then
        sitename="Алгоритмика"
    fi
    if [ "$section" = "en" ]; then
        sitename="Algorithmica"
        edit="Edit this page"
        view_history="View history"
    fi
    if [ "$section" = "tg" ]; then
        sitename="Tinkoff Generation"
    fi
    basename=`basename ${file%.md}`
    index="FALSE"  # TODO: swap true and false
    title=`grep -m1 -Po "^# *\K(.*)$" ${file}`
    echo "Building ${file}..."
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
    --variable edit="$edit" \
    --variable view_history="$view_history" \
    --metadata index="$index" \
    --standalone --mathjax
done
