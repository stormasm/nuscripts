
def sortme [mycol: string] {
  [[lang, gems, grade]; [nu, 100, b] [ rust 104 c] [go 102 a]] | sort-by $mycol
}
