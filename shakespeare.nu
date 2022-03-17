
let filename = '/Users/ma/j/tmp17/nudata/csv/shakespeare.csv'

# open ./shakespeare.csv | get play_name | each { |line| $line | str trim }

# open $filename | get play_name | each { |line| $line | str trim }

open $filename
