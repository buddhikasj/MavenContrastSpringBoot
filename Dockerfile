FROM openjdk:11.0.1-jre-slim-stretch

ARG webgoat_version=v8.0.0-SNAPSHOT

RUN \
  apt-get update && apt-get install && \
  useradd --home-dir /home/springboot --create-home -U springboot

USER springboot
#RUN cd /home/springboot/; mkdir -p .webgoat-${webgoat_version}
COPY /code/target/provider-search-0.0.1-SNAPSHOT.jar /home/springboot/springboot.jar

EXPOSE 8080

WORKDIR /home/springboot
ENTRYPOINT ["java", "-jar", "/home/webgoat/springboot.jar"]
CMD ["--server.port=8080", "--server.address=0.0.0.0"]
