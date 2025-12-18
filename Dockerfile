# ===== BUILD STAGE =====
FROM maven:3.6.3-eclipse-temurin-8 AS build
WORKDIR /app

# Copiar solo pom.xml para cache de dependencias
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copiar el resto del proyecto
COPY src ./src

# Compilar el proyecto y crear el JAR
RUN mvn -B clean package -DskipTests

# ===== RUNTIME STAGE =====
FROM eclipse-temurin:8-jre-alpine
WORKDIR /app

# Copiar el JAR generado del build stage
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto de Spring Boot
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["java","-jar","/app/app.jar"]
