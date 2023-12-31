#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      books-search.sh
#   created:   13.08.2017.-08:06:54
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   rofi
# Description:
#   Use rofi to search my books.
# Usage:
#   books-search.sh
# -----------------------------------------------------------------------------
# Script:

# Books directory
BOOKS_DIR=~/Books/islam/

# Save find result to F_ARRAY
# readarray -t F_ARRAY <<< "$(find "$BOOKS_DIR" -type f \( -name '*.pdf' -o -name '*.epub' \) )"
readarray -t F_ARRAY <<< "$(find "$BOOKS_DIR" -type f \( -iname \*.pdf -o -iname \*.epub -o -iname \*.mobi -o -iname \*.azw3 -o -iname \*.azw2 \))"
# find ./ -type f \( -iname \*.jpg -o -iname \*.png \)

# Associative array for storing books
# key => book name
# value => absolute path to the file
# BOOKS['filename']='path'
declare -A BOOKS

# Add elements to BOOKS array
get_books() {
    for i in "${!F_ARRAY[@]}"
    do
        path=${F_ARRAY[$i]}
        file=$(basename "${F_ARRAY[$i]}")
        BOOKS+=(["$file"]="$path")
    done
}

# List for rofi
gen_list(){
    for i in "${!BOOKS[@]}"
    do
      echo "$i"
    done
}

main() {
  get_books
  book=$( (gen_list) | rofi -dmenu -i -matching glob -location 0 -p "E-Books" )
  zathura "${BOOKS[$book]}"
  # xreader "${BOOKS[$book]}"
}

main

exit 0
