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

    let package = open $package_file

    log debug "checking package file for missing required keys"
    let required_keys = [$. $.name $.version $.type]
    let missing_keys = $required_keys
        | where {|key| ($package | get -i $key) == null}
    if not ($missing_keys | is-empty) {
        throw-error "invalid_package_file" (
            $"($package_file) is missing the following required keys:"
            + $" ($missing_keys | str join ', ')"
        )
    }

    $package
}

def test10 [dir: path] {
    let package = open-package-file $dir
    print $package
}
