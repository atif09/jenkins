#!/usr/bin/env bash 
echo "Download and Install maven"
cd /usr/local
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
tar xzf apache-maven-3.5.2-bin.tar.gz
ln -s apache-maven-3.5.2  maven
grep -i "JAVA_HOME" /etc/profile|grep -v grep
if [ $? -ne 0 ]
then
echo "export JAVA_HOME=/usr/java/jdk1.8.0_161" >> /etc/profile
echo "export PATH=/usr/java/jdk1.8.0_161/bin:$PATH" >> /etc/profile 
fi
echo "export M2_HOME=/usr/local/maven" > /etc/profile.d/maven.sh
echo "export PATH=/usr/local/maven/bin:$PATH" >> /etc/profile.d/maven.sh
source /etc/profile
source /etc/profile.d/maven.sh
mvn -version
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
