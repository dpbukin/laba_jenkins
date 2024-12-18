FROM openjdk:17
COPY  build/libs/serviceone-0.0.1-SNAPSHOT.jar serviceone.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "serviceone.jar"]