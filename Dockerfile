FROM openjdk:8-jdk-alpine
MAINTAINER Nikhil
COPY /target/*.jar batch10.jar
RUN sh -c 'touch *.jar'
ENTRYPOINT ["java","-jar","/batch10.jar"]
