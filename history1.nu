
if ( "historynew.txt" | path exists) {
    # print 'removing file'
    rm historynew.txt
}

def update_history_file [entry] {
    append ($entry | str trim) | save --append historynew.txt
}

def update_history_file_with_list [entries] {
    $entries | each { |it| $it } | save --append historynew.txt
}

#update_history_file michael
#update_history_file iris
#update_history_file_with_list [ls time version cls]

def partone [] {
    let nogo = [cls exit jjj version gs l iox ioxg iox01 iox02 ls "help commands"]
    open history.txt | lines | filter {|x| not ($x in $nogo)}
}

#cat history.txt
let myanswer = partone
#print $myanswer
update_history_file_with_list $myanswer
#cat historynew.txt
