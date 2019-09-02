FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/breno500as/sca-eureka-service.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/sca-eureka-service /app
RUN mvn install -DskipTests
WORKDIR cd /target
ADD target/sca-eureka-service-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE -Djava.security.egd=file:/dev/./urandom -jar app.jar" ]
EXPOSE 8761

#docker build -t eureka-web:v1 .
#docker run -p 8761:8761 -e "SPRING_PROFILES_ACTIVE=test" eureka-web:v1