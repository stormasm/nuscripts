def contrast_colour [ colour:int ] {
    # The first 16 colors
    if $colour < 16 {
        if $colour == 0 {
            15
        } else {
            0
        }
    } else {
      # The gray colors
      if $colour > 231 {
          if $colour < 244 {
              15
          } else {
              0
          }
      } else {
        # The rest
        let r = ($colour - 16) / 36
        let g = (($colour - 16) mod 36) / 6
        let b = ($colour - 16) mod 6

        let luminance = ($r * 299) + ($g * 587) + ($b * 114)
        if $luminance > 2500 {
            0
        } else {
            15
        }
      }
    }
}

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
