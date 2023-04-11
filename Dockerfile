FROM centos:7

# Install prerequisites
#RUN yum -y update
RUN yum -y install java-1.8.0-openjdk wget
RUN yum -y install curl
RUN mkdir /usr/local/tomcat
RUN wget https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.43/bin/apache-tomcat-8.5.43.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp 
RUN tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.43/* /usr/local/tomcat/

EXPOSE 4041
# java
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64

# Define default command.
CMD ["bash"]

ADD sample.war /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/webapps

CMD ["catalina.sh", "run"]
