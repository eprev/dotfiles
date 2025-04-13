# sh.vim: bash

# kill process
kp () {
  local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
    kp
  fi
}

# kill server
ks () {
  local pid=$(lsof -Pwni tcp | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:tcp]'" | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
    ks
  fi
}

relpath () {
  python3 -c "import os.path; print(os.path.relpath('$1','${2:-$PWD}'))"
}

# Change working directory to the top-most Finder window location
cdf () {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Determine size of a file or total size of a directory
fs () {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

hash git &>/dev/null
if [ $? -eq 0 ]; then
  # Find files in the repository
  gf () {
    local root=$(git rev-parse --show-toplevel)
    local files=$(git -C "$root" ls-files | grep -i "$1")
    local rel="$(relpath "$PWD" "$root")/"
    for file in $=files; do
      relpath "$file" "$rel"
    done
  }

  # Use Git’s colored diff when available
  diff () {
    git diff --no-index --color-words "$@"
  }

fi

hash rg &>/dev/null
if [ $? -eq 0 ]; then
  # Find (grep) and replace (sed) text in the directory
  # Usage: `replace 'foo\(' 'bar(' -- src`
  replace () {
    local a="$1"; shift
    local b="$1"; shift
    rg -l "$a" $@ | xargs -0 -I '{}' sed -i -E "s/$a/$b/"g {}
  }

fi

# Create a data URL from a file
dataurl () {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Compare original and gzipped file size
gz () {
  local origsize=$(wc -c < "$1")
  local gzipsize=$(gzip -c "$1" | wc -c)
  local ratio=$(echo "$gzipsize * 100/ $origsize" | bc -l)
  printf "orig: %d bytes\n" "$origsize"
  printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio"
}

# Escape UTF-8 characters into their 3-byte format
escape () {
  printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo # newline
  fi
}

# Decode \x{ABCD}-style Unicode escape sequences
unidecode () {
  perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo # newline
  fi
}

# Get a character’s Unicode code point
codepoint () {
  perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo # newline
  fi
}

# Add note to Notes.app (OS X 10.8)
# Usage: `note 'title' 'body'` or `echo 'body' | note`
# Title is optional
note () {
  local title
  local body
  if [ -t 0 ]; then
    title="$1"
    body="$2"
  else
    title=$(cat)
  fi
  osascript >/dev/null <<EOF
tell application "Notes"
  tell account "iCloud"
    tell folder "Notes"
      make new note with properties {name:"$title", body:"$title" & "<br><br>" & "$body"}
    end tell
  end tell
end tell
EOF
}

# Add reminder to Reminders.app (OS X 10.8)
# Usage: `remind 'foo'` or `echo 'foo' | remind`
remind () {
  local text
  if [ -t 0 ]; then
    text="$1" # argument
  else
    text=$(cat) # pipe
  fi
  osascript >/dev/null <<EOF
tell application "Reminders"
    tell the default list
        make new reminder with properties {name:"$text"}
    end tell
end tell
EOF
}

# Manually remove a downloaded app or file from the quarantine
unquarantine () {
  for attribute in com.apple.metadata:kMDItemDownloadedDate com.apple.metadata:kMDItemWhereFroms com.apple.quarantine; do
    xattr -r -d "$attribute" "$@"
  done
}

# Start an HTTP server from a directory, optionally specifying the port
server () {
    local port="${1:-3000}"
    sleep 1 && open "http://localhost:${port}/" &
    python3 -m http.server "$port"
}