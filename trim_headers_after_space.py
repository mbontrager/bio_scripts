#!/usr/bin/env python

"""trim_headers_after_space.py : Remove superfluous characters in fasta 
headers. Particularly useful for QIIME .fasta output when converting to 
MOTHUR format, for example.

Usage: python trim_headers_after_space.py input.fasta output.fasta"""

__author__ = "Martin Bontrager"
__license__ = "GPL"
__maintainer__ = "Martin Bontrager"
__email__ = "mbontrager@gmail.com"
__status__ = "Production"

import sys


f = open(sys.argv[2],'w')

for line in open(sys.argv[1]):
    if line.startswith(">"):
        line = line.split()
        f.write(line[0] + '\n')
    else:
        f.write(line)

f.close()
