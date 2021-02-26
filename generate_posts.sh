#!/usr/bin/env bash
set -euo pipefail

rm -f posts_lists.html

for post in $(exa -s old ./posts_raw); do
    filename="${post%.*}"
    echo $filename
    pandoc -o posts/"$filename"_content.html posts_raw/"$post"
    cat template.html | sed s/FILENAME/"$filename"_content.html/ > posts/"$filename".m4
    cd posts
    cat "$filename".m4 | m4 > "$filename".html
    cd ..
    ./extract_title.py $filename >> posts_lists.html
done

head posts_lists.html > recent_posts.html
