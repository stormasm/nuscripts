
### This takes in a gmail contacts csv and spits out the name and the group given a string
### regex match on the group name...

def test1 [] {
    open photo1.csv | get group | each {|e| $e =~ 'photo'}
}
