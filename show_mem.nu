
def show_mem [] {
    0..3 | each {|r|
        sleep 10ms
        echo [{index: ($r) mem: (debug info | get process.memory)}]
    } | collect  {$in} | flatten
}
