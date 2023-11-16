
def filter-csv [filename: string, keyword: string] {
    open $filename | filter {|row| $row.group | str contains $keyword}
}

def filter-test01 [keyword: string] {
    open data/test01.csv | filter {|row| $row.group | str contains $keyword}
}

def filter-test01-photo [] {
    open data/test01.csv | filter {|row| $row.group | str contains photo}
}

def filter-test01-group [keyword: string] {
    open data/test01.csv | get group | filter {|row| $row | str contains $keyword}
}
