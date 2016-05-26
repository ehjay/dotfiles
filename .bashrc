source /etc/skel/.bashrc

JAVA_7_HOME='/usr/local/java/jdk1.7.0_79'
JAVA_8_HOME='/usr/local/java/jdk1.8.0_91'

alias deployPlatform='sudo cp /home/andrewj/dev/platform/target/platform.war /opt/tomcat7/webapps/'
alias java_7="export JAVA_HOME=$JAVA_7_HOME && sudo ln -s -f $JAVA_7_HOME/bin/java /usr/bin/java && java -version"
alias java_8="export JAVA_HOME=$JAVA_8_HOME && sudo ln -s -f $JAVA_8_HOME/bin/java /usr/bin/java && java -version"
alias startTomcat='sudo /opt/tomcat7/bin/startup.sh'
alias stopTomcat='sudo /opt/tomcat7/bin/shutdown.sh'

PATH=$PATH:/home/andrewj/src/play-2.1.5
PATH=$PATH:/usr/local/node/bin
export PATH
