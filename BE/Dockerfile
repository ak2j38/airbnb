FROM openjdk:11-jdk
COPY ./BE/build/libs/*.jar airbnb.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/airbnb.jar"]
