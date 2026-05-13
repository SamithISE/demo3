FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY helloWorld.java .

RUN javac helloWorld.java

CMD ["java", "helloWorld"]
