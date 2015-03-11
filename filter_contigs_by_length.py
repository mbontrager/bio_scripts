#Martin Bontrager
#Thanks to Cara Magnabosco
#Usage: python filter_contigs_by_length.py length input.fa output.fa

import sys
from Bio import SeqIO

n = int(float(sys.argv[1]))
infile = open(sys.argv[2], 'rU')
out = open(sys.argv[3], 'w')

for i in SeqIO.parse(infile, 'fasta'):
	sequence = i.seq
	if len(sequence) > n:
		SeqIO.write(i, out, 'fasta')

infile.close()
out.close()