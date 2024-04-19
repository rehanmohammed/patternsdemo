FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM eclipse-temurin:17-alpine
COPY --from=build /target/DogManagmentSystem-0.0.1-SNAPSHOT.jar DogManagmentSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "DogManagmentSystem.jar"]
