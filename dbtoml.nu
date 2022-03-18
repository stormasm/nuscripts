
def update_toml [key,value] {
  open db.toml | update $key $value | to toml | save db.toml
}

def init [] {
  {'name': 'nu', 'stars': 5, 'lang': 'spanish'} | to toml | save db.toml
  echo 'database is initialized...'
}

def main [] {
  init
  open db.toml
  update_toml name 'fish'
  open db.toml
  update_toml stars 7
  open db.toml
  update_toml lang 'italian'
  open db.toml
}

main
