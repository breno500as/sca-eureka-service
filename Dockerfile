FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8761
ADD target/sca-eureka-service-0.0.1-SNAPSHOT.jar app.jar
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -Xmx1024m -Xms256m -jar /app.jar" ]


#sudo docker build -t eureka-service-web .
#sudo docker run -d -p 8761:8761 eureka-service-web