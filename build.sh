for file in `ls articles | grep .md`
do
    pandoc file -o segtree.html --css pandoc.css --standalone --mathjax
done
