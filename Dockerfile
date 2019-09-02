FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/breno500as/sca-eureka-service.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/sca-eureka-service /app
RUN mvn install -DskipTests
WORKDIR cd /target
ADD target/sca-eureka-service-0.0.1-SNAPSHOT.jar app.jar
CMD [ "sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE -Djava.security.egd=file:/dev/./urandom -jar app.jar" ]