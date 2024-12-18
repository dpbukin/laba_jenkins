FROM openjdk:17

RUN apt-get update && apt-get install -y maven  && \
       chmod +x /usr/bin/mvn  && \
       chown root:root /usr/bin/mvn

COPY  build/libs/serviceone-0.0.1-SNAPSHOT.jar serviceone.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "serviceone.jar"]