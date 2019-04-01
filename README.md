# MongoDB Ops Manger Dockerfile

Runs MongoDB Ops Manager 4.0.x in a container. 
Tested on Kubernetes via minkube and macOS Docker version 18.09.2, build 6247962

**THIS IS A STANDALONE INSTANCE WITH NO BACKUPS or HTTPS CONFIGURED, FOR DEV ONLY**

See https://github.com/desteves/mms-bosh-release for scripts that do the heavy lifting

Docker repo: https://hub.docker.com/r/nullstring/mms

Download as `docker pull nullstring/mms`

Example `docker run -ti  -p 8999:8080 nullstring/mms:latest /bin/bash`

*Ensure Docker Engine has allocated sufficient RAM for it's resources* (I set mines to 10GB)



