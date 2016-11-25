################################################################################
#
# This file sets some useful tomcat options. copy it to:
#
#   /opt/tomcat7/bin/setenv.sh
#
################################################################################

################################################################################
#
# JAVA_OPTS
#
# The -X options set the heap size for the JVM
#
# The jmxremote properties allow JMX monitoring with:
#
#   sudo <jdk>/bin/jvisualvm      (for CPU, memory and threads)
#   sudo <jdk>/bin/jconsole       (for beans, such as JDBC pool properties)
#
# For example, in jconsole you can check numBusyConnections under Attributes
# to see if the JDBC pool is tied up:
#
#   com.mchange.v2.c3p0 > PooledDataSource > some hash > Attributes
#
################################################################################

export JAVA_OPTS="-Dfile.encoding=UTF-8 -Xms1536m -Xmx1536m -XX:PermSize=256m -XX:MaxPermSize=256m \
  -Dcom.sun.management.jmxremote=true \
  -Dcom.sun.management.jmxremote.port=9011 \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Dcom.sun.management.jmxremote.authenticate=false"

################################################################################
#
# JPDA_OPTS
#
# Allows remote debugging. For example in IntelliJ:
#
#   Run > Edit Configurations... > + > Remote > Port: 5005
#
# Note that the Play framework uses port 9999 by default
#
################################################################################

export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
