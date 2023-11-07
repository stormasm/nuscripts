
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
        $result | enumerate | each { |e| $e.index}
}

def test3 [] {
    let photo1 = "data" | path join "test01.csv"
    let init = open $photo1
    let result = open $photo1 | each {|e| echo $e.index}
}

def test4 [] {
    let photo1 = "data" | path join "test01.csv"
    let init = open $photo1
    let result = open $photo1 | enumerate | each {|e| echo $e.0}
    $result
}

def test5 [] {
    let names = [Mark Tami Amanda Jeremy]
    $names | each { |it| $"Hello, ($it)!" }
    # Outputs "Hello, Mark!" and three more similar lines.
    $names | enumerate | each { |it| $"($it.index) - ($it.item)" }
}

def test6 [] {
    [true, false, false, true, false, true] | enumerate | each { |r| print $r}
}

def test7 [] {
    [true, false, false, true, false, true] | enumerate | each { |r| if $r.item == true {print $r.index}}
}

def test8 [] {
    [true, false, false, true, false, true] | enumerate | each { |r| if $r.item == true {$r.index}}
}

def test9 [] {
    [true, false, false, true, false, true] | where $it == true
}
