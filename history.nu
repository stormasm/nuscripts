
if ( "myhistory.txt" | path exists) {
    #print 'removing file'
    rm myhistory.txt
}

def update_history_file [entry] {
    append ($entry | str trim) | save --append myhistory.txt
}

def update_history_file_with_list [entries] {
    $entries | each { |it| $it } | save --append myhistory.txt
}

update_history_file michael
update_history_file iris
update_history_file_with_list [ls time version cls]

let nogo = [cls exit time ls version]

open myhistory.txt | lines | filter {|x| not ($x in $nogo)}
