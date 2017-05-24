# search and replace

function replaceRecursively() {
  if [ -z "$1" ]
  then
    echo "First param cannot be empty"
    exit 1
  fi

  echo "Recursively replacing '$1' with '$2' ..."
  # too slow:
  # find ./ -type f -exec sed -i -e "s/$1/$2/g" {} \;

  grep -rl --exclude-dir={node_modules,jspm_packages,coverage,public} "$1" . | xargs sed -i "s/$1/$2/g"
}

alias reprec=replaceRecursively

# git

function gitNew() {
  git fetch
  git log --oneline origin/$1..
}

alias initGit='[ -f ~/.gitignore ] || echo ".*.sw?" >> ~/.gitignore && git config --global core.excludesfile ~/.gitignore'
alias gitb='git branch'
alias gitd='git diff'
alias gitds='git diff --staged'
alias gitc='git config --global credential.helper "cache --timeout=3600"'
alias gitcm='git checkout master'
alias gitf='git fetch'
alias gitl='git fetch && git branch --list -a'
# usage: "gitn basebranch" - what's new in current branch vs the basebranch
alias gitn=gitNew
alias gitp='git pull'
alias gits='git status'

# new chrome with new profile
alias chro='FOLDER=~/chrome-profiles/$(date +%s | sha256sum | base64 | head -c 4) && google-chrome --user-data-dir="$FOLDER" && echo $FOLDER'
