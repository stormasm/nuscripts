def print_colour [ colour:int ] {
    let text = $"($colour | into string | str lpad -c ' ' -l 3)(ansi reset)"
    $text + " "
}

let printable_colours = 256

def print_run [start:int, amount:int] {
  for i in $start..<($start + $amount) {
    if $i < $printable_colours {
      print_colour $i
    } else {
      ""
    }
  } | append "  " | str collect
}

def print_blocks [start:int, end:int, block-cols:int, block-rows:int, blocks-per-line:int] {
  let block-length = ($block-cols * $block-rows)
  let end = (($end - $start) / (($blocks-per-line) * $block-length))
  for i in 0..<$end {
    for row in 0..<$block-rows {
      for block in 0..<$blocks-per-line {
        print_run ($start + $block * $block-length + $row * $block-cols + $i * $block-length * $blocks-per-line) $block-cols
      } | append (char nl) | str collect
    } | str collect
  } | str collect
}

print_blocks 16 123 6 6 3
