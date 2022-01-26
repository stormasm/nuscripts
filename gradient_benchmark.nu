def iter_inc [incr mult iter] {
    $incr + $mult * $iter
}

let is_release = input "Did you compile in a release mode? y/n "

if ($is_release | str downcase | str trim) == "y" {

    # 0. this has wrong output
    let 0 = (seq 10 | benchmark {        
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each {
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = (iter_inc 2 2 $col)
                if $fgcolor > 200 && $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
                }
            } | str collect)
            $"($row_data)(char newline)"
        } | str collect
    } | math avg)

    

    # 1. Fixed newline to fix the outpu (char cr)
    let 1 = (seq 10 | benchmark {        
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each {
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = (iter_inc 2 2 $col)
                if $fgcolor > 200 && $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
                }
            } | str collect)
            $"($row_data)(char cr)" 
        } | str collect
    } | math avg)
    
    # 2. Replace (char sp) with just space
    let 2 = (seq 10 | benchmark {        
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each {
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = (iter_inc 2 2 $col)
                if $fgcolor > 200 && $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m (ansi -e '0m')"
                }
            } | str collect)
            $"($row_data)(char cr)" 
        } | str collect
    } | math avg)

    # 3. Precompute (ansi -e '48;2;0;0;') and (ansi -e '0m') -- seems to be slower
    let 3 = (seq 10 | benchmark {        
        let height = 40
        let width = 160
        let stamp = 'Nu'
        let ansi1 = ansi -e '48;2;0;0;'
        let ansi2 = ansi -e '0m'        
        seq 0 $height | each {
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = (iter_inc 2 2 $col)
                if $fgcolor > 200 && $fgcolor < 210 {
                    $"($ansi1)($fgcolor)m($stamp)($ansi2)"
                } else {
                    $"($ansi1)($fgcolor)m(char sp)($ansi2)"
                }
            } | str collect)
            $"($row_data)(char cr)" 
        } | str collect
    } | math avg)

    # 4. Inline iter_inc call
    let 4 = (seq 10 | benchmark {        
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each {
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = 2 + 2 * $col
                if $fgcolor > 200 && $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
                }
            } | str collect)
            $"($row_data)(char cr)" 
        } | str collect
    } | math avg)

    # 5. Combine (char sp) substitution and iter_inc inlining
    let 5 = (seq 10 | benchmark {        
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each {
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = 2 + 2 * $col
                if $fgcolor > 200 && $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m (ansi -e '0m')"
                }
            } | str collect)
            $"($row_data)(char cr)" 
        } | str collect
    } | math avg)

    # 6. The above with par-each outer loop (using par-each anywhere else breaks the output)
    let 6 = (seq 10 | benchmark {        
        let height = 40
        let width = 160
        let stamp = 'Nu'         
        seq 0 $height | par-each {
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = 2 + 2 * $col
                if $fgcolor > 200 && $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m (ansi -e '0m')"
                }
            } | str collect)
            $"($row_data)(char cr)" 
        } | str collect
    } | math avg)
    
    [ $0 $1 $2 $3 $4 $5 $6 ]

} else {
    echo "Compile in a release mode!"
}