#!/bin/bash
jupyter-nbconvert articles/*.ipynb
rsync -r articles/*.{html,pdf,css} root@sereja.me:/var/www/html/a/
git add *
git commit --allow-empty-message -m ''
git push
