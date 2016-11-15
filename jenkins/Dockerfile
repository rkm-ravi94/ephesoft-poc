FROM jenkins

USER root
RUN apt-get update && apt-get -y install mysql-client
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/
COPY scripts/db.properties /var/jenkins_home/scripts/db.properties
COPY scripts/dbUpdate.sh /var/jenkins_home/scripts/dbUpdate.sh
