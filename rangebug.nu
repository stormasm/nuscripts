
# the script is supposed to interleave the elements of the list
# so that you can compare pairs of successive elements, e.g.
# [1, 2, 3] would become [[1, 2], [2, 3]]

def test01 [] {
    let sorted = [storm]
    $sorted | range 1.. | zip ($sorted | range ..(-2))
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
