
### this works for nushell history that is in text files
### see https://github.com/nushell/nushell/pull/10870
### for the origin of this script

def sortbyme [] {
open $nu.history-path |
        lines |
        split column ' ' cmd |
        group-by cmd --to-table |
        update items {|u| $u.items | length} |
        sort-by items -r |
        first 10 |
        table -n 1
}

### take your history.txt file and make a smaller version of it

def savenlines [lines] {
open $nu.history-path |
        lines |
        first $lines |
        save -f why.txt
}
