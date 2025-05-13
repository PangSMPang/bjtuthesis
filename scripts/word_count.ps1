# File: word_count.ps1
# Usage: scripts\word_count.ps1 bjtuthesis.tex

$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param (
    [string]$MAIN_TEX = $args[0]
)

if (-not $MAIN_TEX) {
    Write-Host "❌ Please provide the main TeX filename, e.g., .\word_count.ps1 bjtuthesis.tex"
    exit 1
}

if (-not (Test-Path $MAIN_TEX)) {
    Write-Host "❌ File not found: $MAIN_TEX"
    exit 1
}

Write-Host "📑 Counting words, main file: $MAIN_TEX"
Write-Host "--------------------------------------"

# Run texcount to recursively count words in included files
& texcount -utf8 -inc -sum -nocolor $MAIN_TEX | Out-File -Encoding UTF8 outputs\bjtuthesis.wordcnt

# Display summary statistics
Write-Host "📋 Word count summary:"
Write-Host "--------------------------------------"

$lines = Get-Content outputs\bjtuthesis.wordcnt
$start = ($lines | Select-String '^Sum of files:' | Select-Object -First 1).LineNumber - 1
$end = ($lines | Select-String '^Subcounts:' | Select-Object -First 1).LineNumber - 1

$lines[$start..$end] | ForEach-Object { Write-Host $_ }

# Display indented Subcounts items
$lines[($end+1)..($lines.Length - 1)] | Where-Object { $_ -match '^\s{2,}' } | ForEach-Object { Write-Host $_ }

Write-Host "--------------------------------------"
Write-Host "ℹ Complete information saved to outputs\bjtuthesis.wordcnt"