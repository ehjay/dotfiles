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

# proxy

alias charles='java_8 && ~/src/charles/bin/charles'

# tomcat/bin/setenv.sh
# export JAVA_OPTS="-Dfile.encoding=UTF-8 -Xms1536m -Xmx1536m -XX:PermSize=256m -XX:MaxPermSize=256m"
# export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

# jpda allows remote debug with tomcat
# play debug run allows remote by default on port 9999
# can connect to both remotes with intellij
# Run > Edit Configurations... > + > Remote > Port: 5005 or 9999

# apps

alias gotoPlatform='cd ~/dev/platform && pwd && thisBranch'
alias migratePlatform='echo "running flyway ..." && mvn clean compile flyway:migrate'
alias cleanPlatform='echo "cleaning platform ..." && sudo rm -rf ~/dev/platform/target/platform*'
alias buildPlatform='echo "building platform ..." && mvn clean install -Dmaven.test.skip=true'
alias removePlatform='echo "removing platform from Tomcat ..." && sudo rm -rf /opt/tomcat7/webapps/platform*'
alias copyPlatform='echo "copying platform ..." && sudo cp ~/dev/platform/target/platform.war /opt/tomcat7/webapps/'
alias startTomcat="echo 'starting Tomcat ...' && sudo /opt/tomcat7/bin/catalina.sh jpda start"
alias stopTomcat="echo 'stopping Tomcat ...' && sudo /opt/tomcat7/bin/catalina.sh jpda stop"
alias tailTomcat='sudo tail -f /opt/tomcat7/logs/catalina.out'
alias readTomcat='sudo less /opt/tomcat7/logs/catalina.out'

alias deployPlatform='stopTomcat && gotoPlatform && checkMvnConfig && rmM2Repo && java_7 && migratePlatform && cleanPlatform && buildPlatform && removePlatform && copyPlatform && startTomcat'
alias deployPlatformNoDep='stopTomcat && buildPlatform && removePlatform && copyPlatform && startTomcat'
alias depplat='deployPlatform'
alias depplatnodep='deployPlatformNoDep'

alias gotoWebapi='cd ~/dev/webapi && pwd && thisBranch'
alias deployWebapi='java_7 && gotoWebapi && play debug run'
alias depwapi='deployWebapi'

alias gotoGateway='cd ~/dev/api-gateway && pwd && thisBranch'
alias deployGateway='gotoGateway && rmNodeMod && make install serve'
alias depgat='deployGateway'

alias gotoMatchhub='cd ~/dev/matchhub && pwd && thisBranch'
alias deployMatchhub='java_8 && gotoMatchhub && rmNodeMod && make install && make build && sudo make run'
alias depmat='deployMatchhub'

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

alias startEjabberd="sudo ejabberdctl start"
alias stopEjabberd="sudo ejabberdctl stop"
alias restartEjabberd="stopEjabberd && startEjabberd"
alias tailEjabberd="sudo tail -f /opt/ejabberd-16.03/logs/ejabberd.log"

# postgres

alias restartPostgres='sudo /etc/init.d/postgresql restart'
SU_POSTGRES='sudo su postgres -c'
alias platDB="$SU_POSTGRES \"psql platform postgres\""
alias matDB="$SU_POSTGRES \"psql matchhub postgres\""
alias cmsDB='psql -U cms -d cms -h localhost -W'

# exports

export GOPATH=~/gocode

# path

PATH=$PATH:/home/andrewj/src/play-2.1.5
PATH=$PATH:/usr/local/node/bin
PATH=$PATH:"$GOPATH/bin"
export PATH
