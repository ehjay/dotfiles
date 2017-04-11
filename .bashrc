source /etc/skel/.bashrc

# find screen names with xrandr -q
SECOND_MONITOR="DP1"

function dimPercent() {
  if [ $1 -ge 50 -a $1 -le 100 ]
  then
    xrandr --output $SECOND_MONITOR --brightness $(bc -l <<< "$1/100")
  else
    echo "invalid brightness: $1"
    echo "brightness must be between 50 and 100"
  fi
}

alias dim=dimPercent
alias undim="xrandr --output $SECOND_MONITOR --brightness 1"

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
alias thisBranch='echo "git branch: $(git rev-parse --abbrev-ref HEAD)"'

alias gitb='git branch'
alias gitd='git diff'
alias gitds='git diff --staged'
alias gitc='git checkout'
alias gitcache='git config --global credential.helper "cache --timeout=3600"'
alias gitcm='git checkout master'
alias gitcoc='git checkout open-challenge'
alias gitf='git fetch'
alias gitl='git fetch && git branch --list -a'
# usage: "gitn basebranch" - what's new in current branch vs the basebranch
alias gitn=gitNew
alias gitp='git pull'
alias gitpo='git push origin'
alias gitrem='git remote -v'
alias gitresmast='git reset --hard origin/master'
alias gitresoc='git reset --hard origin/open-challenge'
alias gits='git status'

# make
alias mkbs='make build serve'
alias mki='make install'

# chrome
alias chro='FOLDER=~/chrome-profiles/$(date +%s | sha256sum | base64 | head -c 4) && google-chrome --user-data-dir="$FOLDER" && echo $FOLDER'

# java

JAVA_7_HOME='/usr/local/java/jdk1.7.0_79'
JAVA_8_HOME='/usr/local/java/jdk1.8.0_91'

alias java_7="echo 'switching to java 7 ...' && export JAVA_HOME=$JAVA_7_HOME && sudo ln -s -f $JAVA_7_HOME/bin/java /usr/bin/java && java -version"
alias java_8="echo 'switching to java 8 ...' && export JAVA_HOME=$JAVA_8_HOME && sudo ln -s -f $JAVA_8_HOME/bin/java /usr/bin/java && java -version"

alias checkMvnConfig='[ -f ~/.m2/settings.xml ] && echo "found ~/.m2/settings.xml" || echo "ERROR: missing ~/.m2/settings.xml"'

alias rmM2Repo='echo "removing ~/.m2/repository ..." && rm -rf ~/.m2/repository'
alias rmNodeMod='echo "removing node_modules ..." && rm -rf node_modules'

# mvn

# this is a workaround for copying someone else's .m2 folder
# first, cp -R the .m2/repository folder into ~/.m2
# then remove other users metadata
# for xSocket [2.4, 2.5) error just manually edit
# .m2/repository/org/xlightweb/xlightweb/2.5/xlightweb-2.5.pom
# to have <xsocket.version>2.4.6</xsocket.version>
# then build targets using mvn -o (offline)

alias removeMvnMetadata='find ~/.m2/repository \( -name _remote.repositories -o -name _maven.repositories -o -name "*maven-meta*" -o -name resolver-status.properties \) -exec rm -v {} \;'

# node

alias depsize='cost-of-modules'
alias topdepsize='cost-of-modules --less --no-install'

# apps

alias gotoPlatform='cd ~/dev/platform && pwd && thisBranch'
alias migratePlatform='echo "running flyway ..." && mvn clean compile flyway:migrate'
alias cleanPlatform='echo "cleaning platform ..." && sudo rm -rf ~/dev/platform/target/platform*'
alias buildPlatform='echo "building platform ..." && mvn clean install -Dmaven.test.skip=true'
alias buildPlatformOffline='echo "building platform offline ..." && mvn -o clean install -Dmaven.test.skip=true'
alias removePlatform='echo "removing platform from Tomcat ..." && sudo rm -rf /opt/tomcat7/webapps/platform*'
alias copyPlatform='echo "copying platform ..." && sudo cp ~/dev/platform/target/platform.war /opt/tomcat7/webapps/'
alias startTomcat="echo 'starting Tomcat ...' && sudo /opt/tomcat7/bin/catalina.sh jpda start"
# alias stopTomcat="echo 'stopping Tomcat ...' && sudo /opt/tomcat7/bin/catalina.sh jpda stop"
alias stopTomcat='echo "stopping Tomcat ..." && sudo kill -9 $(ps aux | grep "[t]omcat" | awk '\''{print $2}'\'')'
alias startTomcatNoJpda="echo 'starting Tomcat ...' && sudo /opt/tomcat7/bin/startup.sh"
alias stopTomcatNoJpda="echo 'stopping Tomcat ...' && sudo /opt/tomcat7/bin/shutdown.sh"
alias tailTomcat='sudo tail -f /opt/tomcat7/logs/catalina.out'
alias readTomcat='sudo less /opt/tomcat7/logs/catalina.out'

alias deployPlatform='stopTomcat && gotoPlatform && checkMvnConfig && java_8 && make migrate && cleanPlatform && buildPlatform && removePlatform && copyPlatform && startTomcat'

alias cleanWebapi='rm -rf ~/src/play-2.1.5/repository/cache'
alias gotoWebapi='cd ~/dev/webapi && pwd && thisBranch'
alias deployWebapi='java_7 && gotoWebapi && play debug run'
alias depwapi='deployWebapi'

alias gotoGateway='cd ~/dev/api-gateway && pwd && thisBranch'
alias deployGateway='gotoGateway && rmNodeMod && make install serve'
alias depgat='deployGateway'

alias gotoMatchhub='cd ~/dev/matchhub && pwd && thisBranch'
alias deployMatchhub='java_8 && gotoMatchhub && make build && sudo make run'
alias depmat='deployMatchhub'

alias gotoHub='cd ~/dev/hub-api'
alias deployHub='java_8 && gotoHub && make build && sudo make run'

alias gotoCms='cd ~/dev/cms && pwd && thisBranch'
alias deployCms='gotoCms && rmNodeMod && make install serve'
alias shrinkCms='gotoCms && rm npm-shrinkwrap.json && make distclean install && npm shrinkwrap'
alias depcms='deployCms'

alias gotoAdmin='cd ~/dev/adminosaurus && pwd && thisBranch'
alias deployAdmin='gotoAdmin && rmNodeMod && make install serve'
alias shrinkAdmin='gotoAdmin && rm npm-shrinkwrap.json && make distclean install && npm shrinkwrap'
alias depadmin='deployAdmin'

alias gotoWebapp='cd ~/dev/webapp && pwd && thisBranch'
alias deployWebapp='gotoWebapp && rmNodeMod && make install build serve'
alias depwapp='deployWebapp'

alias startRabbit='sudo rabbitmq-server -detached'
alias stopRabbit='sudo rabbitmqctl stop'

alias startEjabberd="sudo /opt/ejabberd-16.03/bin/ejabberdctl start"
alias stopEjabberd="sudo /opt/ejabberd-16.03/bin/ejabberdctl stop"
alias restartEjabberd="stopEjabberd && startEjabberd"
alias tailEjabberd="sudo tail -f /opt/ejabberd-16.03/logs/ejabberd.log"

# postgres

# show SQL statements in logs by editing
#   /etc/postgresql/9.5/main/postgresql.conf
# to have:
#   log_statement = 'all'

alias tailPostgres='sudo tail -f /var/log/postgresql/postgresql-9.5-main.log'
alias restartpg='sudo /etc/init.d/postgresql restart'
alias startpg='sudo /etc/init.d/postgresql start'
alias stoppg='sudo /etc/init.d/postgresql stop'

SU_POSTGRES='sudo su postgres -c'
alias platDB="$SU_POSTGRES \"psql platform postgres\""
alias matDB="$SU_POSTGRES \"psql matchhub postgres\""
alias cmsDB='psql -U cms -d cms -h localhost -W'

# exports

export GOPATH=~/gocode

# path

#PATH=$PATH:/home/andrewj/src/play-2.1.0
PATH=$PATH:/home/andrewj/src/play-2.1.5
PATH=$PATH:/usr/local/flyway-4.0.3
PATH=$PATH:/usr/local/node/bin
PATH=$PATH:"$GOPATH/bin"
export PATH
