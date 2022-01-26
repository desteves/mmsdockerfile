# MongoDB Ops Manger Dockerfile

[![Git](https://app.soluble.cloud/api/v1/public/badges/c978f519-e89b-4c83-87f0-e750c3150e9c.svg?orgId=679096383598)](https://app.soluble.cloud/repos/details/github.com/desteves/mmsdockerfile?orgId=679096383598)  

Runs MongoDB Ops Manager 4.0.x in a container. 
Tested on Kubernetes via minkube and macOS Docker version 18.09.2, build 6247962

**THIS IS A STANDALONE INSTANCE WITH NO BACKUPS or HTTPS CONFIGURED, FOR DEV ONLY**

See https://github.com/desteves/mms-bosh-release for scripts that do the heavy lifting

Docker repo: https://hub.docker.com/r/nullstring/mms

Download as `docker pull nullstring/mms`

Example `docker run -ti  -p 8999:8080 nullstring/mms:latest /bin/bash`

*Ensure Docker Engine has allocated sufficient RAM for it's resources* (I set mines to 10GB)



