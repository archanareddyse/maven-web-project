# Use an official Tomcat runtime as a base image
FROM tomcat:9.0-jre8

# Remove the default Tomcat welcome page
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file from the target directory of your Maven build to the Tomcat webapps directory
COPY target/web.war /usr/local/tomcat/webapps/web.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]
