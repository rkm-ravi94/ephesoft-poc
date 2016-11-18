FROM jenkins

USER root

RUN apt-get update && apt-get -y install jq

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
COPY scripts/ /var/jenkins_home/scripts/functions/
