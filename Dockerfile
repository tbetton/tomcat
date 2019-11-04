#Download base image  tomcat
FROM  tomcat:9.0.27-jdk11

# copy files user mapping to config folder
COPY conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY conf/host-manager.xml /usr/local/tomcat/conf/Catalina/localhost/host-manager.xml
COPY conf/manager.xml /usr/local/tomcat/conf/Catalina/localhost/manager.xml

RUN curl -L -O "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb" && \
    dpkg -i filebeat-7.4.0-amd64.deb;

COPY conf/filebeat.yml /etc/filebeat/filebeat.yml

#EXPOSE PORT
EXPOSE 8080

