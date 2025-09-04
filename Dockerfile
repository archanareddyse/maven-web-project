# Use Tomcat 9 as the base image
FROM tomcat:9.0


# Copy your WAR file into Tomcat’s webapps directory
COPY target/*.war /usr/local/tomcat/webapps/

# Expose port 8080 for access
EXPOSE 8080

# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]
