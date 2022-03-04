FROM  openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8080
COPY --from=build /home/app/target/*.jar ms-devops.jar
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /ms-devops.jar" ]