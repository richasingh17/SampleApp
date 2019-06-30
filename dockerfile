FROM 855754041257.dkr.ecr.us-east-2.amazonaws.com/baseimage:latest

#Adding war file
ADD SampleApp.war apache-tomcat-8.0.23/webapps/
CMD apache-tomcat-8.0.23/bin/startup.sh && tail -f apache-tomcat-8.0.23/logs/catalina.out
EXPOSE 8080
