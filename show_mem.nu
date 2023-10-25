
def show_mem [] {
    mut recs = []
    mut previous = 0
    for r in 0..3 {
        sleep 10ms
        let current = (debug info | get process.memory)
        $recs = $recs ++ [{index: ($r) cur_mem: ($current) prev_mem: ($previous) delta: (($current | into int) - ($previous | into int))}]
        $previous = $current
    }
$recs
}

def show_mem_01 [] {
    0..3 | each {|r|
        sleep 10ms
        echo [{index: ($r) mem: (debug info | get process.memory)}]
    } | collect  {$in} | flatten
}
