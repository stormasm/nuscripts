let filename = '/Users/ma/j/tmp17/nudata/csv/shakespeare.csv'

def check_params [id: int, name: string] {
  echo id name
}

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
  open $filename | get play_name | each { |line| $line | str trim | check_playname $line}
}

def main1 [] {
  open $filename | select line_id play_name | each { |id| | $id}
}

main1
