
let mylines = ["john ran to the store", "rick ate hotdogs", "mike took the dog for a walk", "help", "ls"]

# Note this only filters out strings that only have one word in them
def partone [] {
    let nogo = ["help", "ls"]
    $mylines | filter {|x| not ($x in $nogo)}
}

def partwo [] {
    $mylines | find --invert help ls john
}
