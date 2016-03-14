from java:8

copy .ssh /root/.ssh
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa.pub
run mkdir /app
expose 8080
copy jenkins.war /app/
RUN mkdir /data
workdir /app
CMD java -jar jenkins.war


