FROM ubuntu

MAINTAINER gomezd

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list;
RUN apt-get update; apt-get install -y unzip openjdk-6-jdk wget supervisor

RUN wget -q -N http://apache.petsads.us/incubator/storm/apache-storm-0.9.1-incubating/apache-storm-0.9.1-incubating.tar.gz; tar -xzf apache-storm-0.9.1-incubating.tar.gz -C /usr/share/;
RUN ln -s /usr/share/apache-storm-0.9.1-incubating /usr/share/storm; rm apache-storm-0.9.1-incubating.tar.gz

ENV STORM_HOME /usr/share/storm


RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm
RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml "${STORM_HOME}/conf/storm.yaml"
ADD cluster.xml "${STORM_HOME}/logback/cluster.xml"
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
