
if ( "newhistory.txt" | path exists) {
    # print 'removing file'
    rm newhistory.txt
}

def update_history_file [entry] {
    append ($entry | str trim) | save --append newhistory.txt
}

def update_history_file_with_list [entries] {
    $entries | each { |it| $it } | save --append newhistory.txt
}

#update_history_file michael
#update_history_file iris
#update_history_file_with_list [ls time version cls]

def partone [] {
    let nogo = [cls exit]
    open history.txt | lines | filter {|x| not ($x in $nogo)}
}

cat history.txt
let myanswer = partone
print $myanswer
update_history_file_with_list $myanswer
cat newhistory.txt
