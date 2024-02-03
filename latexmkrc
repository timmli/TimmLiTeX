# -*- mode: Perl; eval: (flycheck-mode -1);-*-
# Manual: http://mirror.physik-pool.tu-berlin.de/pub/CTAN/support/latexmk/latexmk.pdf

$cleanup_mode = 2;
# 1 for full cleanup,
# 2 for cleanup except for .dvi, .ps and .pdf files,
# 3 for cleanup except for dep and aux files.
$clean_ex = "*.fls";
$pdflatex = 'pdflatex -shell-escape %O %S';
