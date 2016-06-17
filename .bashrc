source /etc/skel/.bashrc

# find screen names with xrandr -q
SECOND_MONITOR="DP1"
alias dim="xrandr --output $SECOND_MONITOR --brightness 0.8"
alias undim="xrandr --output $SECOND_MONITOR --brightness 1"

JAVA_7_HOME='/usr/local/java/jdk1.7.0_79'
JAVA_8_HOME='/usr/local/java/jdk1.8.0_91'

alias java_7="echo 'switching to java 7 ...' && export JAVA_HOME=$JAVA_7_HOME && sudo ln -s -f $JAVA_7_HOME/bin/java /usr/bin/java && java -version"
alias java_8="echo 'switching to java 8 ...' && export JAVA_HOME=$JAVA_8_HOME && sudo ln -s -f $JAVA_8_HOME/bin/java /usr/bin/java && java -version"

alias gotoPlatform='cd ~/dev/platform'
alias migratePlatform='echo "running flyway ..." && mvn compile flyway:migrate'
alias cleanPlatform='echo "cleaning platform ..." && sudo rm -rf ~/dev/platform/target/platform*'
alias buildPlatform='echo "building platform ..." && mvn install -Dmaven.test.skip=true'
alias stopTomcat='echo "stopping Tomcat ..." && sudo /opt/tomcat7/bin/shutdown.sh'
alias removePlatform='echo "removing platform ..." && sudo rm -rf /opt/tomcat7/webapps/platform*'
alias copyPlatform='echo "copying platform ..." && sudo cp ~/dev/platform/target/platform.war /opt/tomcat7/webapps/'
alias startTomcat='echo "starting Tomcat ..." && sudo /opt/tomcat7/bin/startup.sh'
alias tailTomcat='sudo tail -f /opt/tomcat7/logs/catalina.out'

alias deployPlatform='java_7 && gotoPlatform && migratePlatform && cleanPlatform && buildPlatform && stopTomcat && removePlatform && copyPlatform && startTomcat'

alias gotoWebapi='cd ~/dev/webapi'
alias deployWebapi='java_7 && gotoWebapi && pwd && play debug run'

alias gotoGateway='cd ~/dev/api-gateway'
alias deployGateway='gotoGateway && make serve'

alias gotoMatchhub='cd ~/dev/matchhub'
alias deployMatchhub='java_8 && gotoMatchhub && pwd && make build && sudo make run'

alias gotoCms='cd ~/dev/cms'
alias deployCms='gotoCms && make serve'
alias shrinkCms='gotoCms && rm npm-shrinkwrap.json && make distclean install && npm shrinkwrap'

alias gotoWebapp='cd ~/dev/webapp'
alias deployWebapp='gotoWebapp && pwd && make build && make serve'

alias startRabbit='sudo rabbitmq-server -detached'
alias stopRabbit='sudo rabbitmqctl stop'

alias startEjabberd="sudo ejabberdctl start"
alias stopEjabberd="sudo ejabberdctl stop"
alias restartEjabberd="stopEjabberd && startEjabberd"
alias tailEjabberd="sudo tail -f /opt/ejabberd-16.03/logs/ejabberd.log"

SU_POSTGRES='sudo su postgres -c'
alias pDB="$SU_POSTGRES \"psql platform postgres\""
alias mDB="$SU_POSTGRES \"psql matchhub postgres\""

alias ignoreSwp="echo \"*.swp\" >> .gitignore"

PATH=$PATH:/home/andrewj/src/play-2.1.5
PATH=$PATH:/usr/local/node/bin
export PATH
