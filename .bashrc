source /etc/skel/.bashrc

# find screen names with xrandr -q
SECOND_MONITOR="DP1"
alias dim="xrandr --output $SECOND_MONITOR --brightness 0.8"
alias undim="xrandr --output $SECOND_MONITOR --brightness 1"

JAVA_7_HOME='/usr/local/java/jdk1.7.0_79'
JAVA_8_HOME='/usr/local/java/jdk1.8.0_91'

alias java_7="echo 'switching to java 7 ...' && export JAVA_HOME=$JAVA_7_HOME && sudo ln -s -f $JAVA_7_HOME/bin/java /usr/bin/java && java -version"
alias java_8="echo 'switching to java 8 ...' && export JAVA_HOME=$JAVA_8_HOME && sudo ln -s -f $JAVA_8_HOME/bin/java /usr/bin/java && java -version"

alias stopTomcat='echo "stopping Tomcat ..." && sudo /opt/tomcat7/bin/shutdown.sh'
alias removePlatform='echo "removing platform ..." && sudo rm -rf /opt/tomcat7/webapps/platform*'
alias copyPlatform='echo "copying platform ..." && sudo cp /home/andrewj/dev/platform/target/platform.war /opt/tomcat7/webapps/'
alias startTomcat='echo "starting Tomcat ..." && sudo /opt/tomcat7/bin/startup.sh'
alias followTomcat='sudo tail -f /opt/tomcat7/logs/catalina.out'

alias deployPlatform='java_7 && stopTomcat && removePlatform && copyPlatform && startTomcat'

alias gotoWebapi='cd ~/dev/webapi'
alias deployWebapi='java_7 && gotoWebapi && pwd && play debug run'

alias gotoMatchhub='cd ~/dev/matchhub'
alias deployMatchhub='java_8 && gotoMatchhub && pwd && make build && sudo make run'

alias gotoWebapp='cd ~/dev/webapp'
alias deployWebapp='gotoWebapp && pwd && make build && make serve'

alias startRabbit='sudo rabbitmq-server -detached'
alias stopRabbit='sudo rabbitmqctl stop'

PATH=$PATH:/home/andrewj/src/play-2.1.5
PATH=$PATH:/usr/local/node/bin
export PATH
