
open "./data/test02.csv" | append {name: ls, value: 3}

touch tmp.csv | append {name: berk, value: 34}

open "./data/test02.csv" | each {|e| if $e.name != "exit" { append {name: berk, value: 34}}}

open "./data/test02.csv" | filter {|e| $e.name != "exit"} | save -f tmp.csv

#open history.txt | lines | split column ' ' cmd | first 20

append ("foo\n" | str trim) | save --append foo.txt
append ("bar\n" | str trim) | save --append foo.txt

open myhistory2.txt | lines | filter {|e| $e != "exit"}

let nogo = [cls exit time]

open myhistory2.txt | lines | filter {|x| not ($x in $nogo)}
