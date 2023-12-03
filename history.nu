
def update_history_file [entry] {
    append ($entry | str trim) | save --append myhistory.txt
}

update_history_file michael
update_history_file iris
