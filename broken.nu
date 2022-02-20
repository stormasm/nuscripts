### This example is here to show the user
### That a brace has to be on the same line as the def
###
### If you uncomment any of the 3 defs below this is
### the error message you will see
###
### Error: nu::parser::missing_positional
### The error message is: "Missing required positional argument"
### missing block
###
### help: Usage: def <def_name> <params> <block>
###

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
