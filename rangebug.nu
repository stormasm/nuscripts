
# the script is supposed to interleave the elements of the list
# so that you can compare pairs of successive elements, e.g.
# [1, 2, 3] would become [[1, 2], [2, 3]]

# this crash and burns nushell in debug mode but not release mode
def test01 [] {
    let sorted = [storm]
    $sorted | range 1.. | zip ($sorted | range ..(-2))
}

# this crash and burns nushell in debug mode but not release mode
def test01a [] {
    ([1] | range ..(-2))
}

def test01b [] {
    ([1 2] | range ..(-2))
}

def test02 [] {
    let sorted = [1 2 3]
    $sorted | range 1.. | zip ($sorted | range ..(-2))
}

def test03 [] {
    let sorted = [1 2 3 4]
    $sorted | range 1.. | zip ($sorted | range ..(-2))
}

def test04 [] {
    [albuquerque denver dallas] | zip [nm co tx]
}

def test10a [] {
    ([1] | range ..(-3))
}

def test10b [] {
    ([1] | range ..(-2))
}

def test10c [] {
    ([1] | range ..(-1))
}
