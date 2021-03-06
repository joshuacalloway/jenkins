from java:8

run mkdir -p /root/.ssh
run cd /tmp && \
            ssh-keygen -f id_rsa -t rsa -N '' && \
            chmod 400 id_rsa
RUN mv /tmp/id_rsa /root/.ssh/id_rsa
RUN mv /tmp/id_rsa.pub /root/.ssh/id_rsa.pub

run echo "please save this deployment key to your project on github or bitbucket"
run cat /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa.pub
run mkdir /app
expose 8080
expose 50000
run apt-get update && apt-get install -y vim
add https://updates.jenkins-ci.org/latest/jenkins.war /app/jenkins.war
#copy jenkins.war /app/
RUN mkdir /data
run cd /tmp && curl -O https://bootstrap.pypa.io/get-pip.py && python2.7 get-pip.py && pip install awscli
workdir /app
ADD .jenkins /root/.jenkins
ONBUILD add .jenkins /root/.jenkins


CMD BUILD_ID=stayAlive java -jar jenkins.war


