function update {
  local d="$1"
  if [ -d "$d" ]; then
    if [ -e "$d/.ignore" ]; then 
      echo "\nIgnoring $d"
    else
      cd $d > /dev/null 
      if [ -d ".git" ]; then
        echo "\nUpdating `pwd`"
        git reset --hard origin
      else
        scan *
      fi
      cd .. > /dev/null
    fi
  fi
}

function scan {
  for x in $*; do
    update "$x"
  done
}

if [ "$1" != "" ]; then cd $1 > /dev/null; fi
echo"Scanning ${PWD}"
scan *