
# From this conversation
# https://discord.com/channels/601130461678272522/683070703716925568/1166453881446858763

def format_auto [] {
    $env.config.filesize.format = auto
}

def format_b [] {
    $env.config.filesize.format = b
}

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

def table_ex [] {
    debug info | table -e --expand-deep 1
}
