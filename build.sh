#!/bin/bash
mkdir -p web/{en,ru,tg}
for sec in {en,ru,tg}
do
    cp -r src/${sec}/img web/${sec}/img
done
cd src
for file in `find {en,ru,tg} -iname "*.md" -type f`
do
    section=${file:0:2}
    edit="Редактировать"
    view_history="История"
    migration="<a href='https://ru.algorithmica.org/cs/'>Сайт переезжает.</a> Большинство статей уже перенесено на новую версию.<br>Скоро добавим автоматические переходы, но пока обновленную версию этой статьи можно найти там."
    if [ "$section" = "ru" ]; then
        sitename="Алгоритмика"
    fi
    if [ "$section" = "en" ]; then
        sitename="Algorithmica"
        edit="Edit this page"
        view_history="View history"
        migration="<a href='https://en.algorithmica.org/hpc/'>I'm writing a book.</a> It's free and available online. You can find an updated version of this and many more of my old articles there.<br>— Sergey Slotin"
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
    --variable migration="$migration" \
    --metadata index="$index" \
    --standalone --mathjax
done
