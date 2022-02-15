
def noflag [x] {
  echo $x
}

def flag1 [
  --flag(-f)
] {
  echo $flag
}

def flag2 [
    --flag(-f)
] {
  echo $flag
}
