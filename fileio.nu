use std log

#use utils/dirs.nu [ nupm-home-prompt script-dir module-dir tmp-dir ]
#use utils/log.nu throw-error

use log.nu throw-error

def open-package-file [dir: path] {
    let package_file = $dir | path join "test01.csv"

    print $package_file

    if not ($package_file | path exists) {
        throw-error "package_file_not_found" (
            $'Could not find "package.nuon" in ($dir) or any parent directory.'
        )
    }

    $package_file
}

def test10 [dir: path] {
    let csv = open-package-file $dir
    #print $csv
    open $csv | get group | each {|e| $e =~ 'photo'}
}
