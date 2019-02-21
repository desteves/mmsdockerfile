#FROM centos/ruby-23-centos7
FROM centos:7


MAINTAINER desteves


EXPOSE 27017
EXPOSE 8080


ENV BOSH_INSTALL_TARGET /var/vcap/packages

RUN   yum update -y
RUN   yum install -y wget 

RUN mkdir -p ${BOSH_INSTALL_TARGET}
RUN /usr/sbin/groupadd -r vcap
RUN /usr/sbin/useradd -M -r -g vcap -d ${BOSH_INSTALL_TARGET} -s /bin/false  -c vcap vcap > /dev/null 2>&1

# install mongodb
RUN   mkdir -p ${BOSH_INSTALL_TARGET}/mongodb-4.0.1
RUN   wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-4.0.1.tgz
RUN   ls -a 
RUN   tar xzf mongodb-linux-x86_64-4.0.1.tgz  --strip 1 --directory ${BOSH_INSTALL_TARGET}/mongodb-4.0.1

# install mms
RUN   mkdir -p ${BOSH_INSTALL_TARGET}/mongodb-mms-4.0.1
RUN   wget https://s3.amazonaws.com/mongodb-mms-build-onprem/0dac6f313138aed7a06bcfd53e792b676c5b139d/mongodb-mms-4.0.8.50386.20190206T1708Z-1.x86_64.tar.gz
RUN   tar xzf mongodb-mms-4.0.8.50386.20190206T1708Z-1.x86_64.tar.gz  --strip 1 --directory ${BOSH_INSTALL_TARGET}/mongodb-mms-4.0.1

#CMD ["/bin/bash"]
COPY docker-entrypoint.sh .
ENTRYPOINT ["bash", "docker-entrypoint.sh"]







