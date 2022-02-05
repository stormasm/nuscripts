
#### spend some time on these concepts at some point (or sooner)

[discord](https://discord.com/channels/601130461678272522/889232844101156914/939513364269375519)

def wsj [] {
  let f = (fetch https://www.wsj.com/market-data/quotes/fx/USDCNY/historical-prices | url query web 'tr' | str collect (char nl) | detect columns)
  $f | first 10
}
