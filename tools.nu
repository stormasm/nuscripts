### kubouch script
### use tools.nu *

def tool-complete [] {
    [ valgrind kcachegrind tracy help none gdbgui nuon ]
}

export def profile [
    inp           : path
    out?          : path
    --bpp(-b)     : number
    --profile(-p) : int
    --tool(-t)    : string@tool-complete
    --verbose(-v)
    --all(-a)
] {
    let bpp = if $bpp == $nothing {
        2
    } else {
        $bpp
    }

    let profile = if $profile == $nothing {
        3
    } else {
        $profile
    }

    let out = if $out == $nothing {
        $inp | path basename
    } else {
        $out
    }

    let verbose = if $verbose {
        '-v'
    } else {
        $nothing
    }

    let jxs_args = ([
        -b $bpp
        -p $profile
        $verbose
        $inp
        $out
    ] | compact)

    if ($tool == valgrind) || ($tool == kcachegrind) {
        let vgr_args = [
            --tool=callgrind
            --callgrind-out-file=callgrind.out
        ]

        let vgr_args = if $all == false {
            $vgr_args | append [
                #--instr-atstart=no
                #--collect-atstart=yes
                #--toggle-collect=tco_enc_image
            ]
        } else {
            $vgr_args
        }

        valgrind $vgr_args jxs_enc_dec $jxs_args
        callgrind_annotate ./callgrind.out

        if $tool == kcachegrind {
            kcachegrind callgrind.out
        } else {
            source ~/git/extern/nu_scripts/virtual_environments/conda.nu
            load-env (conda-env prof)

            gprof2dot --format=callgrind --output=out.dot callgrind.out -s
            dot -Tpng out.dot -o perf.png
        }

        $"PSNR: (psnr $inp $out) dB"
    } else if $tool == tracy {
        sudo jxs_enc_dec $jxs_args
        $"PSNR: (psnr $inp $out) dB"
    } else if $tool == help {
        jxs_enc_dec
    } else if ($tool == $nothing) || ($tool == none) {
        jxs_enc_dec $jxs_args
        $"PSNR: (psnr $inp $out) dB"
    } else if $tool == gdbgui {
        with-env { SHELL: /bin/bash } { gdbgui --args jxs_enc_dec $jxs_args }
        $"PSNR: (psnr $inp $out) dB"
    } else if $tool == nuon {
        jxs_enc_dec $jxs_args
        | complete
        | get stdout
        | lines
        | drop 1
        | skip 11
        | str collect (char nl)
        | from nuon
    } else {
        let msg = $'Unknown --tool(-t) option: ($tool)'
        let span = (metadata $tool).span

        error make {
            msg: 'Tool not supported'
            label: {
                text: 'tool not supported'
                start: $span.start
                end: $span.end
            }
        }
    }
}

export def psnr [
    inp: path
    out: path
] {
    if ($out | path exists) == false {
        let span = (metadata $out).span

        error make {
            msg: 'Output file does not exist'
            label: {
                text: 'not a valid file'
                start: $span.start
                end: $span.end
            }
        }
    } else if ($inp | path exists) == false {
        let span = (metadata $inp).span

        error make {
            msg: 'Input file does not exist'
            label: {
                text: 'not a valid file'
                start: $span.start
                end: $span.end
            }
        }
    } else {
        run-external --redirect-stderr compare '-metric' psnr $inp $out /dev/null
        | complete
        | get stderr
    }
}

def compiler-complete [] {
    [ gcc clang ]
}

def mode-complete [] {
    [ debug debugopt release ]
}

export def compile [
    compiler?: string@compiler-complete
    --mode(-m): string@mode-complete
    --tracy(-t)
    --clean(-c)
    --static(-s)
    --verbose(-v)
    --bear(-b)
    --nuon(-n)
] {
    let compiler_env = if $compiler == 'gcc' {
        { CC: gcc, CXX: g++ }
    } else if $compiler == 'clang' {
        { CC: clang, CXX: clang++ }
    } else {
        { }
    }

    let clean_flag = if $clean {
        'clean'
    }

    let tracy_flag = if $tracy {
        'tracy=1'
    }

    let static_flags = if $static {
        [ '-f' 'Makefile_static' ]
    }

    let mode_flags = if $mode != $nothing {
        $"mode=($mode)"
    }

    let verbose_flags = if $verbose {
        'TCO_VERBOSE=1'
    }

    let nuon_flags = if $nuon {
        'NUON=1'
    }

    let args = (
        [ $clean_flag, $tracy_flag, $static_flags $mode_flags $verbose_flags
          $nuon_flags]
        | flatten
        | compact)

    with-env $compiler_env {
        source ~/git/extern/nu_scripts/virtual_environments/conda.nu
        load-env (conda-env py2)

        print ([ 'make -C build' ] | append $args | str collect ' ')
        if $bear {
            bear -- make -C build $args
        } else {
            make -C build $args
        }
    }
}
