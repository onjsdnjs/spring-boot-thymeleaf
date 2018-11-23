FROM java:8
VOLUME /tmp
ADD target/spring-boot-thymeleaf-1.0.0-SNAPSHOT.war app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]