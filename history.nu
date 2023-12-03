
def myupdate [entry] {
    append ($entry | str trim) | save --append myhistory.txt
}

myupdate "michael\n"
myupdate "iris\n"
