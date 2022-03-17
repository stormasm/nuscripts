
let previous_playname = ''

def check_playname [name: string] {
  if ($name == previous_playname) {
    echo name
  } else {
    let previous_playname = $name
  }
  echo $previous_playname
}

let filename = '/Users/ma/j/tmp17/nudata/csv/shakespeare.csv'

open $filename | get play_name | each { |line| $line | str trim | check_playname $line}
