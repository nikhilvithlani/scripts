# destructive update of all git repos within this directory to match origin
# modified version of script I found here https://gist.github.com/mslinn/3151915 
function update {
  local d="$1"
  if [ -d "$d" ]; then
    if ["$d/.ignore" ]; then 
      echo "\nIgnoring $d"
    else
      cd $d > /dev/null 
      if [ -d ".git" ]; then
        echo "\nUpdating `pwd`"
        git fetch origin
        git reset --hard origin/mainline
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