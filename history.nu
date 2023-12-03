
open "./data/test02.csv" | append {name: ls, value: 3}

touch tmp.csv | append {name: berk, value: 34}

open "./data/test02.csv" | each {|e| if $e.name != "exit" { append {name: berk, value: 34}}}
