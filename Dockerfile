FROM gradle:8.4.0-jdk-21 as builder
COPY . /app
WORKDIR /app
RUN gradle build --no-daemon

FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
