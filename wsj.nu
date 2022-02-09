
### [discord](https://discord.com/channels/601130461678272522/889232844101156914/939513364269375519)

### To register the plugin
#
# cargo build --all-features (aliased to cbaf)
# bring up nushell
#
# register -e capnp ./target/debug/nu_plugin_query
#
# check that the plugin was loaded correctly
#
# help commands | where is_plugin == $true
# chkplug
# def chkplug [] {
#    help commands | where is_plugin == $true
# }
#
# source wsj.nu
# wsj

def wsj [] {
  let f = (fetch https://www.wsj.com/market-data/quotes/fx/USDCNY/historical-prices |query web -q 'tr' | str collect (char nl) | detect columns)
  $f | first 10
}
