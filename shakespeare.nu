let filename = '/Users/ma/j/tmp17/nudata/csv/shakespeare.csv'
#let filename = '/Users/ma/j/tmp17/dataset/csv/shakespeare_nu6.csv'

def set_data [name: string] {
  $name | to csv | save db.txt
}

def get_data [name: string] {
  open $name
}

def check_params2 [record] {
  check_params $record.line_id $record.play_name
}

def check_params [id: int, name: string] {
  check_playname $id $name
}

def check_playname [id: int, name: string] {
  let previous_playname = get_data db.txt
  if ($name != $previous_playname) {
    set_data $name
    [[id, name];[($id), $name]]
  } else {
    $nothing
  }
}

def main [] {
  open $filename | get play_name | each { |line| $line | str trim | check_playname 1 $line}
}

def main1 [] {
  open $filename | select line_id play_name | each { |id| check_params2 $id} | flatten | to csv | save shakespeare.csv
}

def main2 [] {
  open $filename | select line_id play_name | each { |id| check_params $in.1 $in.2}
}

main1
