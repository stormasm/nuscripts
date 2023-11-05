use std log

#use utils/dirs.nu [ nupm-home-prompt script-dir module-dir tmp-dir ]
#use utils/log.nu throw-error

use log.nu throw-error

def getfile [dir: path] {
    let src_file = $dir | path join "test01.csv"

    print $src_file

    if not ($src_file | path exists) {
        throw-error "package_file_not_found" (
            $'Could not find "package.nuon" in ($dir) or any parent directory.'
        )
    }

    $src_file
}

def test10 [dir: path] {
    let csv = getfile $dir
    #print $csv
    open $csv | get group | each {|e| $e =~ 'photo'}
}
