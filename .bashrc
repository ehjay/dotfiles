source /etc/skel/.bashrc

# find screen names with xrandr -q
SECOND_MONITOR="DP1"
alias dim="xrandr --output $SECOND_MONITOR --brightness 0.8"
alias undim="xrandr --output $SECOND_MONITOR --brightness 1"

# git

alias initGit='[ -f ~/.gitignore ] || echo ".*.sw?" >> ~/.gitignore && git config --global core.excludesfile ~/.gitignore'
alias thisBranch='echo "git branch: $(git rev-parse --abbrev-ref HEAD)"'

# java

JAVA_7_HOME='/usr/local/java/jdk1.7.0_79'
JAVA_8_HOME='/usr/local/java/jdk1.8.0_91'

alias java_7="echo 'switching to java 7 ...' && export JAVA_HOME=$JAVA_7_HOME && sudo ln -s -f $JAVA_7_HOME/bin/java /usr/bin/java && java -version"
alias java_8="echo 'switching to java 8 ...' && export JAVA_HOME=$JAVA_8_HOME && sudo ln -s -f $JAVA_8_HOME/bin/java /usr/bin/java && java -version"

alias checkMvnConfig='[ -f ~/.m2/settings.xml ] && echo "found ~/.m2/settings.xml" || echo "ERROR: missing ~/.m2/settings.xml"'

alias rmM2Repo='echo "removing ~/.m2/repository ..." && rm -rf ~/.m2/repository'
alias rmNodeMod='echo "removing node_modules ..." && rm -rf node_modules'

# apps

alias gotoPlatform='cd ~/dev/platform && pwd && thisBranch'
alias migratePlatform='echo "running flyway ..." && mvn clean compile flyway:migrate'
alias cleanPlatform='echo "cleaning platform ..." && sudo rm -rf ~/dev/platform/target/platform*'
alias buildPlatform='echo "building platform ..." && mvn clean install -Dmaven.test.skip=true'
alias stopTomcat='echo "stopping Tomcat ..." && sudo /opt/tomcat7/bin/shutdown.sh'
alias removePlatform='echo "removing platform from Tomcat ..." && sudo rm -rf /opt/tomcat7/webapps/platform*'
alias copyPlatform='echo "copying platform ..." && sudo cp ~/dev/platform/target/platform.war /opt/tomcat7/webapps/'
alias startTomcat='echo "starting Tomcat ..." && sudo /opt/tomcat7/bin/startup.sh'
alias tailTomcat='sudo tail -f /opt/tomcat7/logs/catalina.out'

alias deployPlatform='gotoPlatform && checkMvnConfig && rmM2Repo && java_7 && migratePlatform && cleanPlatform && buildPlatform && stopTomcat && removePlatform && copyPlatform && startTomcat'

alias gotoWebapi='cd ~/dev/webapi && pwd && thisBranch'
alias deployWebapi='java_7 && gotoWebapi && play debug run'

alias gotoGateway='cd ~/dev/api-gateway && pwd && thisBranch'
alias deployGateway='gotoGateway && rmNodeMod && make install serve'

alias gotoMatchhub='cd ~/dev/matchhub && pwd && thisBranch'
alias deployMatchhub='java_8 && gotoMatchhub && rmNodeMod && make install && make build && sudo make run'

alias gotoCms='cd ~/dev/cms && pwd && thisBranch'
alias deployCms='gotoCms && rmNodeMod && make install serve'
alias shrinkCms='gotoCms && rm npm-shrinkwrap.json && make distclean install && npm shrinkwrap'

alias gotoWebapp='cd ~/dev/webapp && pwd && thisBranch'
alias deployWebapp='gotoWebapp && rmNodeMod && make install build serve'

alias startRabbit='sudo rabbitmq-server -detached'
alias stopRabbit='sudo rabbitmqctl stop'

alias startEjabberd="sudo ejabberdctl start"
alias stopEjabberd="sudo ejabberdctl stop"
alias restartEjabberd="stopEjabberd && startEjabberd"
alias tailEjabberd="sudo tail -f /opt/ejabberd-16.03/logs/ejabberd.log"

# postgres

SU_POSTGRES='sudo su postgres -c'
alias pDB="$SU_POSTGRES \"psql platform postgres\""
alias mDB="$SU_POSTGRES \"psql matchhub postgres\""

# path

PATH=$PATH:/home/andrewj/src/play-2.1.5
PATH=$PATH:/usr/local/node/bin
export PATH
