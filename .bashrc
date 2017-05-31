alias g='git'

# new chrome with new profile
alias chro='FOLDER=~/chrome-profiles/$(date +%s | sha256sum | base64 | head -c 4) && google-chrome --user-data-dir="$FOLDER" && echo $FOLDER'
