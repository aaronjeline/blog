#!/usr/bin/env python3
import os
import sys

filename = sys.argv[1]
out_name = 'posts/%s.html' % filename
in_name = 'posts_raw/%s.md' % filename
with open(in_name, 'r') as f:
    contents = f.read().split('\n')
title = contents[0][1:].strip()
line = '<li><a href=\"%s\">%s</a></li>' % (out_name, title)
print(line)
