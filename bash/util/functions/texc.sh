 Compile latex more robustly

texc() {
  pdflatex -halt-on-error -file-line-error -output-directory $(dirname "$1") "$1"
}
