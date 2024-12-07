FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/serviceone-0.0.1-SNAPSHOT.jar serviceone.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "serviceone.jar"]