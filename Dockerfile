FROM maven:3.5-jdk-8-alpine as build
ADD pom.xml ./pom.xml
ADD src ./src
RUN mvn package -DskipTests=true

FROM java:8
VOLUME /tmp
COPY --from=build /target/spring-boot-thymeleaf-1.0.0-SNAPSHOT.jar app.jar /app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]