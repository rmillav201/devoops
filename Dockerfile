FROM eclipse-temurin:17.0.10_7-jdk-jammy
WORKDIR /appmavenjenkins
ADD . /appmavenjenkins
COPY target/demo-0.0.1.jar /appmavenjenkins/app.jar

ENV NAME_DB ${DB_HOST:-jdbc:h2:file:./test}
ENV USERNAME_DB ${DB_USERNAME:-user}
ENV PASSWORD_DB ${DB_PASSWORD:-password}

EXPOSE 8000
ENTRYPOINT ["java", "-jar", "/appmavenjenkins/app.jar", "-web -webAllowOthers -tcp -tcpAllowOthers -browser"]
