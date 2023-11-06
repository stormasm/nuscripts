
### This takes in a gmail contacts csv and spits out the name and the group given a string
### regex match on the group name...

def test1 [] {

    let photo1 = "data" | path join "test01.csv"
    open $photo1 | get group | each {|e| $e =~ 'photo'}
}

def test2 [] {

    let photo1 = "data" | path join "test01.csv"
    let init = open $photo1
    let result = open $photo1 | get group | each {|e| $e =~ 'photo'}
        $result | each { |e| if $e == true {$init.name}}
}
