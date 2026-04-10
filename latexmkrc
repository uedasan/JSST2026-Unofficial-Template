$max_repeat = 5;
$bibtex_use = 2;

$latex = 'uplatex -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$lualatex = 'lualatex -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$bibtex = 'upbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';

$pdf_mode = 3;
$dvi_mode = 0;
$postscript_mode = 0;

$clean_ext = 'bbl blg dvi fdb_latexmk fls lof log lot out aux toc';
