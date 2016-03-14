
docker run -v /var/run/docker.sock:/var/run/docker.sock \
           -v $(which docker):/bin/docker \
           -ti -p 8080:8080 jenkins
