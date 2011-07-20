export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"


export JAVA_HOME=${HOME}/jdk

export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:${JAVA_HOME}/lib/tools.jar:${JAVA_HOME}/lib/dt.jar

export M2_HOME=${HOME}/ws/maven2
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
MAVEN_OPTS='-Xms256m -Xmx796m -XX:PermSize=64m -XX:MaxPermSize=136m'