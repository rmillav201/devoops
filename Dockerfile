FROM eclipse-temurin:17.0.10_7-jdk-jammy
WORKDIR /appmavenjenkins
ADD . /appmavenjenkins
COPY target/demo-0.0.1.jar /appmavenjenkins/app.jar

#ENV USERNAME_DB=${USERNAME_DB:-user}
#ENV PASSWORD_DB=${PASSWORD_DB:-password}

EXPOSE 8000
ENTRYPOINT ["java", "-jar", "/appmavenjenkins/app.jar", "-web -webAllowOthers -tcp -tcpAllowOthers -browser"]
