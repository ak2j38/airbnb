FROM openjdk:11-jdk
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} airbnb.jar
ENTRYPOINT ["java","-jar","/airbnb.jar"]
