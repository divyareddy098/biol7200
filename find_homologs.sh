#!/bin/bash
makeblastdb -in "$2" -dbtype nucl -out subjdb
tblastn -query "$1" -db subjdb -outfmt "6 qseqid sseqid pident length qlen" -out raw.tsv
awk '$3 > 30 && $4 >= 0.9 * $5' raw.tsv > "$3"
awk 'END {print NR}' "$3"
