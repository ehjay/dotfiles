source /etc/skel/.bashrc

# find screen names with xrandr -q
SECOND_MONITOR="DP1"
alias dim="xrandr --output $SECOND_MONITOR --brightness 0.8"
alias undim="xrandr --output $SECOND_MONITOR --brightness 1"

JAVA_7_HOME='/usr/local/java/jdk1.7.0_79'
JAVA_8_HOME='/usr/local/java/jdk1.8.0_91'

alias java_7="export JAVA_HOME=$JAVA_7_HOME && sudo ln -s -f $JAVA_7_HOME/bin/java /usr/bin/java && java -version"
alias java_8="export JAVA_HOME=$JAVA_8_HOME && sudo ln -s -f $JAVA_8_HOME/bin/java /usr/bin/java && java -version"

alias deployPlatform='sudo cp /home/andrewj/dev/platform/target/platform.war /opt/tomcat7/webapps/'
alias startTomcat='sudo /opt/tomcat7/bin/startup.sh'
alias stopTomcat='sudo /opt/tomcat7/bin/shutdown.sh'

alias startRabbit='sudo rabbitmq-server -detached'
alias stopRabbit='sudo rabbitmqctl stop'

PATH=$PATH:/home/andrewj/src/play-2.1.5
PATH=$PATH:/usr/local/node/bin
export PATH
