#!/bin/bash
echo $#
if [ $# == 0 ]; then
  old="HEAD^"
elif [ $# == 1 ]; then
  old=$1
else
  echo "Too many arguments"
  exit
fi

echo "abstract-diff for revision $old"

here=$( pwd )
tdir=$( mktemp -d )
echo $tdir
trap 'return_here' INT TERM EXIT
return_here () {
    cd "$here"
    [ -d "$tdir" ] && rm -rf "$tdir"
}

pandoc abstract.markdown -s -o "$tdir/abstract-new.tex" --biblatex
git show HEAD^:abstract.markdown > "$tdir/abstract-old.markdown"
cd "$tdir"
pandoc abstract-old.markdown -s -o abstract-old.tex --biblatex
latexdiff abstract-old.tex abstract-new.tex > abstract-diff.tex
pdflatex abstract-diff.tex
mv abstract-diff.pdf "$here"
pdflatex abstract-new.tex
mv abstract-new.pdf "$here"

return_here
