FROM tomcat:9.0.100

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/TechBlog_Project-23.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
