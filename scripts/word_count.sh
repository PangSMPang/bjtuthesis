#!/bin/bash

# File: word_count.sh
# Usage: scripts/word_count.sh bjtuthesis.tex

MAIN_TEX="$1"

if [ -z "$MAIN_TEX" ]; then
    echo "❌ Please provide the main TeX filename, e.g., ./word_count.sh bjtuthesis.tex"
    exit 1
fi

if [ ! -f "$MAIN_TEX" ]; then
    echo "❌ File not found: $MAIN_TEX"
    exit 1
fi

echo "📑 Counting words, main file: $MAIN_TEX"
echo "--------------------------------------"

# Run texcount to recursively count words in included files
texcount -utf8 -inc -sum -nocolor "$MAIN_TEX" > outputs/bjtuthesis.wordcnt

# Display summary statistics
echo "📋 Word count summary:"
echo "--------------------------------------"
sed -n '/^Sum of files:/,/^Subcounts:/p' outputs/bjtuthesis.wordcnt
sed -n '/^Subcounts:/,$p' outputs/bjtuthesis.wordcnt | grep '^  '
echo "--------------------------------------"
echo "ℹ️ Complete information saved to outputs/bjtuthesis.wordcnt"