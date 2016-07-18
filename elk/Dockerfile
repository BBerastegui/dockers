# ELK stack
FROM ubuntu:latest

MAINTAINER Borja Berastegui version: 0.1
RUN ln -snf /bin/bash /bin/sh

# Install Oracle JDK
RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common apt-transport-https
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update

# For silent java installation
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get install -y oracle-java8-installer

RUN /bin/bash -c 'echo -n 'JAVA_HOME="/usr/lib/jvm/java-8-oracle"' >> /etc/environment'
RUN source /etc/environment

# Elasticsearch repo
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
RUN echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | tee -a /etc/apt/sources.list
RUN echo "deb https://packages.elastic.co/kibana/4.5/debian stable main" | tee -a /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y elasticsearch logstash kibana

# Auto startup
RUN update-rc.d elasticsearch defaults 95 10
RUN update-rc.d kibana defaults 95 10

EXPOSE 5601
EXPOSE 9200
EXPOSE 9292

# Run services
CMD ["service", "elasticsearch", "restart"]
CMD ["service", "kibana", "restart"]
CMD ["/bin/bash"]

