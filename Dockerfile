from java:8

copy .ssh /root/.ssh
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa.pub
run mkdir /app
expose 8080
add https://updates.jenkins-ci.org/latest/jenkins.war /app/jenkins.war
copy jenkins.war /app/
RUN mkdir /data
workdir /app
ADD .jenkins /root/.jenkins
CMD BUILD_ID=stayAlive java -jar jenkins.war


