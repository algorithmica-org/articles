#!/bin/bash
jupyter-nbconvert articles/*.ipynb
rsync -r articles/*.html root@sereja.me:/var/www/html/a/
