### This example is here to show the user
### That a brace has to be on the same line
### as the def

### https://github.com/nushell/nushell/issues/2972

### All of these examples will not parse.

### def p1 [arg]
### { echo $arg }

### def p2 [arg]
### {
### echo $arg }

### def p3 [arg]
### {
### echo $arg
### }
