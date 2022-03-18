let filename = '/Users/ma/j/tmp17/nudata/csv/shakespeare.csv'

def check_params2 [record] {
  check_params $record.line_id $record.play_name
}

def check_params [id: int, name: string] {
  check_playname $name
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
  open $filename | select line_id play_name | each { |id| check_params2 $id}
}

def main2 [] {
  open $filename | select line_id play_name | each { |id| check_params $in.1 $in.2}
}

main1
