from java:8

mkdir /app
copy jenkins.war /app/
workdir /app
CMD java -jar jenkins.war


