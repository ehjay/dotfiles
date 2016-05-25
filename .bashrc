source /etc/skel/.bashrc
alias startTomcat='sudo /opt/tomcat7/bin/startup.sh'
alias stopTomcat='sudo /opt/tomcat7/bin/shutdown.sh'
alias deployPlatform='sudo cp /home/andrewj/dev/platform/target/platform.war /opt/tomcat7/webapps/'
PATH=$PATH:/home/andrewj/src/play-2.1.5
PATH=$PATH:/usr/local/node/bin
export PATH
