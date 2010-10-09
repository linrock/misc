#!/usr/bin/env python

""" Use with mysql pager
    mysql> \P '/path/to/mysql_filter.py'
"""

import sys
from pprint import pprint

stuff = [row for row in sys.stdin.read().split('\n') if '|' in row]
categories = [row.strip() for row in stuff[0].split('|') if row]
data = [[r.strip() for r in row.split('|')] for row in stuff[1:]]

for d in data:
    pprint(dict(zip(categories, d)))
