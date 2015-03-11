#!/bin/bash

# Usage: assemstats.sh

mkdir $PWD/assembly_stats

for f in *.fna; do
	STEM=$(echo ${f} | sed -r 's/^(...).*$/\1/')
	assemstats.py 250 "${f}" > assembly_stats/"${STEM}.stat"
done

TOPFILE=$(ls assembly_stats/*.stat|sort|head -1)

head -n 1 $TOPFILE > assemStats.tmp

echo '---|---|---|---|---|---|---|---|---|---|---|--'- >> assemStats.tmp

tail -q -n +2 assembly_stats/*.stat >> assemStats.tmp

sed -r 's/^(...)__.*fna( .*)$/\1\2/g' assemStats.tmp | sed -r 's/[\t ]+/|/g' > assemStats.md

rm assemStats.tmp
rm -r assembly_stats/
