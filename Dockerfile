#
# Package stage
#
FROM openjdk:8-jdk-alpine as runtime
RUN mkdir /app
COPY --from=builder /build/target/*.jar app.jar
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar" ]
