
## This script shows the different ways
## you can access records in nushell

def show_params01 [record] {
  echo $record.name
}

def show_params02 [record] {
  $record
}

def ex01 [] {
  ls | each { |it| show_params01 $it}
}

def ex02 [] {
  ls | each { |it| show_params02 $it.modified}
}

def ex03 [] {
  ls | select size | $in.0   #you can put any number here
}

def ex04 [] {
  ls | select name size | each { |it| echo $it.name $it.size }
}

def ex05 [] {
  ls | each -n { |it| $"Number ($it.index) is size ($it.item.size)" }
}

ex01
ex02
ex03
ex04
ex05
