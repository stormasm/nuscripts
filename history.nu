
def update_history_file [entry] {
    append ($entry | str trim) | save --append historynew.txt
}

def update_history_file_with_list [entries] {
    $entries | each { |it| $it } | save --append historynew.txt
}

def partone [] {
    let nogo = [cls exit jjj version gs l iox ioxg iox01 iox02 ls "help commands"]
    open history.txt | lines | filter {|x| not ($x in $nogo)}
}

def partwo [] {
    open history.txt | lines | find --invert history source cd open gd gm gcom help ls describe let
}

def go [] {
    if ( "historynew.txt" | path exists) {
        rm historynew.txt
    }

    let myanswer = partwo
    update_history_file_with_list $myanswer
}
