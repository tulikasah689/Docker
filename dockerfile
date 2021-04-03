FROM tomcat:latest
LABEL maintainer="tulikakumari"
COPY target/our-web-app.war /usr/local/tomcat/webapps/


EXPOSE 8086

CMD ["catalina.sh", "run"]
