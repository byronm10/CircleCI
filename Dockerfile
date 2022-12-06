FROM jenkins/jenkins:lts

USER root

# Install aws-cli
RUN apt-get update && apt-get install -y \
      jq \
      groff \
      python3-pip \
      python3 &&\
    pip install --upgrade \
      pip \
      awscli

RUN mkdir /var/jenkins_home/.aws
VOLUME ["/var/jenkins_home/.aws"]

RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common
RUN  chown -R jenkins:jenkins /var/jenkins_home 
VOLUME /var/jenkins_home
