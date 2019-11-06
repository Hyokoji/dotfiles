#!/usr/bin/env perl
$latex            = 'uplatex -synctex=1 -halt-on-error';
$bibtex           = 'upbibtex';
$biber            = 'biber  -u -U --output_safechars';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3;
$pvc_view_file_via_temporary = 0;
if ($^O eq 'darwin') {
  $pdf_previewer = "open -ga /Applications/Skim.app";
} elsif ($^O eq 'linux') {
  $pdf_previewer = 'evince';
}
