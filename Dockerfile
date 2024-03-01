FROM eclipse-temurin:17.0.10_7-jdk-jammy

# Configuración de la aplicación Spring Boot
WORKDIR /app
COPY target/demo-0.0.1.jar app.jar

# Configuración del servidor H2
COPY h2.jar /app/h2.jar

# Exponer puertos para la aplicación Spring Boot y el servidor H2
EXPOSE 8000 9092

# Comando para ejecutar tanto la aplicación Spring Boot como el servidor H2
CMD java -jar app.jar -Dserver.port=8000 & java -cp h2.jar org.h2.tools.Server -tcp -tcpAllowOthers -tcpPort 9092
