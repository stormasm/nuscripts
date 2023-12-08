
let mylines01 = ["john ran to the store", "rick ate hotdogs", "mike took the dog for a walk", "help", "ls"]
let mylines02 = ["help commands | where command_type = "plugin"", "let x = 1", "describe def", "1 + 3"]

# Note this only filters out strings that only have one word in them
def partone [] {
    let nogo = ["help", "ls"]
    $mylines | filter {|x| not ($x in $nogo)}
}

def partwo [] {
    $mylines02 | find --invert help let describe
}
