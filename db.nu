def set_data [name: string] {
  $name | to csv | save db.txt
}

def get_data [name: string] {
  open $name
}

set_data 'jim'
get_data db.txt
