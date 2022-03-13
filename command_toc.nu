
let $list = (help commands | select name | first 10)
$list

['nu', 'shell'] | str collect ' | '


### yields a list<unknown>
help commands | select name | describe

### yields a list<unknown>
[a b c] | describe

### how do I break up a list<unknown> into n items per list
### I want to take all of the commands and put n number of
### commands per line and then make a markdown table with that
