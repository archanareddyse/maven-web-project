# Use an official Maven image as a builder stage
FROM maven:3.8.4-openjdk-11 as builder

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Maven POM file and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the entire project to the container
COPY ./ .

# Build the application
RUN mvn package

# Use an official Tomcat image as the final stage
FROM tomcat:9.0-jdk11-openjdk-slim

# Copy the built WAR file from the builder stage to Tomcat's webapps directory
COPY --from=builder /usr/src/app/target/web.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
