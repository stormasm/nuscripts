def nu-fetch-nightly [] {
  cd /tmp
  http get https://api.github.com/repos/nushell/nightly/releases
    | sort-by -r published_at
    | select tag_name name published_at assets_url assets
    | first
    | get assets
    | get browser_download_url
    | filter { $in =~ 'x86_64-darwin-full' }
    | get 0
    | aria2c -i -
  mkdir nu-nightly; tar xvf nu-*.tar.gz --directory=nu-nightly
  cp -r nu-nightly/**/* .; rm -rf nu-*
  $'(char nl)Update to Nu: (ansi g)(./nu --version)(ansi reset)'
}
