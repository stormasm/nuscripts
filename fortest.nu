eq
cd crates

let subcrates_wave_1 = [
    # components
    nu-utils,
    nu-glob,
    nu-term-grid,
    nu-pretty-hex,
    nu-system,
    nu-path,
    nu-json,
    nu-test-support,
    nu-protocol,
    nu-engine,
    nu-color-config,
    nu-table,
    nu-plugin,
    nu-parser,
    nu-explore,
]

let subcrates_wave_2 = [
    nu-command,
]

let subcrates_wave_3 = [
    nu-cli,

    # plugins
    nu_plugin_query,
    nu_plugin_inc,
    nu_plugin_gstat
]

for subcrate in $subcrates_wave_1 {
    cd $subcrate
    $subcrate
    sleep 1sec
    cd ..
}

for subcrate in $subcrates_wave_2 {
    cd $subcrate
    $subcrate
    sleep 1sec
    cd ..
}

for subcrate in $subcrates_wave_3 {
    cd $subcrate
    $subcrate
    sleep 1sec
    cd ..
}

cd ..

echo 'all done !'
