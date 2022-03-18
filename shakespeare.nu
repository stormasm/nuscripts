
def check_playname [name: string] {
  let previous_playname = get_data db.txt
  if ($name == $previous_playname) {
    echo $name
  } else {
    set_data $name
    echo $name
  }
}

def main [] {
  let filename = '/Users/ma/j/tmp17/nudata/csv/shakespeare.csv'
  open $filename | get play_name | each { |line| $line | str trim | check_playname $line}
}

main
