#!/bin/bash
makeblastdb -in "$2" -dbtype nucl-out subjdb
tblastn -query "$1" -db subjdb -outfmt "6 qseqid sseqid pident length qlen" › raw.tsv
awk $3 > 30 8& $4 >= (0.9 * 85) raw.tsv > "§3"
wC -1 < "$3"
