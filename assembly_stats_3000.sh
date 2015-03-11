#!/bin/bash

# Usage: assemstats.sh

mkdir $PWD/assembly_stats_3000

for f in *.fna; do
	STEM=$(echo ${f} | sed -r 's/^(...).*$/\1/')
	assemstats.py 3000 "${f}" > assembly_stats_3000/"${STEM}.stat"
done

TOPFILE=$(ls assembly_stats_3000/*.stat|sort|head -1)

head -n 1 $TOPFILE > assemStats.tmp

echo '---|---|---|---|---|---|---|---|---|---|---|--'- >> assemStats.tmp

tail -q -n +2 assembly_stats_3000/*.stat >> assemStats.tmp

sed -r 's/^(...)__.*fna( .*)$/\1\2/g' assemStats.tmp | sed -r 's/[\t ]+/|/g' > assemStats_3000.md

rm assemStats.tmp
rm -r assembly_stats_3000
