#!/bin/bash
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <query file> <subject file> <output file>"
    exit 1
fi
QUERY="$1"
SUBJECT="$2"
OUTPUT="$3"
makeblastdb -in "$SUBJECT" -dbtype nucl -out subjdb >/dev/null 2>&1
tblastn -query "$QUERY" -db subjdb -outfmt "6 qseqid sseqid pident length qlen" -out raw.tsv
awk '$3 > 30 && $4 >= 0.9 * $5' raw.tsv > "$OUTPUT"
awk 'END {print NR}' "$OUTPUT"
