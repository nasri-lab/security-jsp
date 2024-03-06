# Use the official Tomcat image as the base image
FROM tomcat:9.0

# Set the working directory to Tomcat's webapps directory
WORKDIR /usr/local/tomcat/webapps/

# Set environment variables for MySQL Connector/J
ENV MYSQL_CONNECTOR_VERSION 8.0.23

# Download and place the MySQL Connector/J JDBC driver in Tomcat's lib directory
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.tar.gz -O /tmp/mysql-connector-java.tar.gz \
    && tar -xzf /tmp/mysql-connector-java.tar.gz -C /tmp \
    && mv /tmp/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.jar ${CATALINA_HOME}/lib/ \
    && rm -rf /tmp/mysql-connector-java*

# Tomcat listens on port 8080
EXPOSE 8080