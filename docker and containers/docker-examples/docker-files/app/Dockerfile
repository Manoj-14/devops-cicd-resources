#build image
FROM maven:3.9.9-eclipse-temurin-21-jammy AS build_image
RUN git clone https://github.com/hkhcoder/vprofile-project.git
WORKDIR vprofile-project
RUN git checkout containers 
RUN mvn clean package

#Service image
FROM tomcat:10-jdk21
LABEL "Project"="Vprofile"
LABEL "Maintainer"="Manoj M"
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build_image vprofile-project/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh","run"] 
#Cmd already have this script but if you have any other script to run we can use it here



