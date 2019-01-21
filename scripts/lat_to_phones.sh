#!/bin/bash
. path.sh

word_symtab=data/lang/words.txt
phone_symtab=data/lang/phones.txt
pdf_symtab=data/lang/pdfs.txt
mdl=data/tree_sp0.95/0.mdl
lmwt=20.0 
penalty=1
. parse_options.sh || exit 1;

decode_dir=$1


if [ ! -f $pdf_symtab ] ; then
  python3 scripts/phones2pdf.py $phone_symtab $pdf_symtab
fi


lattice-scale --inv-acoustic-scale=$lmwt "ark:gunzip -c $decode_dir/lat.*.gz|" ark:- | \
  lattice-add-penalty --word-ins-penalty=$penalty ark:- ark:- | \
  lattice-best-path --word-symbol-table=$symtab ark:- "ark,t:|utils/int2sym.pl -f 2- $word_symtab | sort > $decode_dir/ali_output.txt" ark:- | \
  ali-to-pdf $mdl ark:- "ark,t:|utils/int2sym.pl -f 2- $pdf_symtab | sort > $decode_dir/phones_ali.txt"
