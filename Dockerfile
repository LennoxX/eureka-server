# Base image para compilar o projeto
FROM maven:3.9.4-eclipse-temurin-21 AS build

# Diretório de trabalho para o build
WORKDIR /app

# Copia os arquivos do projeto Maven para o container
COPY pom.xml ./
COPY src ./src

# Comando para compilar o projeto e gerar o JAR
RUN mvn clean package -DskipTests

# Base image para rodar o JAR gerado
FROM openjdk:21-jdk-slim

# Diretório de trabalho na imagem final
WORKDIR /app

# Copia o JAR gerado para a imagem final
COPY --from=build /app/target/*.jar app.jar

#COPY src/main/resources/*.p12 /app/resources

# Porta exposta pela aplicação
EXPOSE 80

# Comando para rodar o JAR
ENTRYPOINT ["java", "-jar", "app.jar"]


# COMANDO PARA CONSTRUIR A IMAGEM
#docker build -t projeto-arquitetura/eureka-server-1.0.0 .