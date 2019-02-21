# mmsdockerfile
MongoDB Ops Manger Dockerfile

See https://github.com/desteves/mongodb-release for scripts that do the heavy lifting

Docker repo: https://hub.docker.com/r/nullstring/mms

Download as `docker pull nullstring/mms`

Example `docker run -ti  -p 8999:8080 nullstring/mms:latest /bin/bash`

*Ensure Docker Engine has allocated sufficient RAM for it's resources* (I set mines to 10GB)
