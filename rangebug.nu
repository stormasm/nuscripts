
def test01 [] {
    let sorted = [storm]
    $sorted | range 1.. | zip ($sorted | range ..(-2))
}
