cp -r img web/img
mkdir web/{ru,en}
find {ru,en} -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "web/${0%.md}.html" --css /pandoc.css --standalone --mathjax' {} \;
