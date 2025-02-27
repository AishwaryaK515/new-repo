# Use OpenJDK as the base image
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from Maven target folder to the container
COPY target/*.jar myapp.jar

# Expose the application port
EXPOSE 8080

# Run the JAR file
CMD ["java", "-jar", "myapp.jar"]
