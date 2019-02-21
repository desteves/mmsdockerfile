#FROM centos/ruby-23-centos7
FROM centos:7


MAINTAINER desteves


EXPOSE 27017
EXPOSE 8080


ENV BOSH_INSTALL_TARGET /var/vcap/packages

# for the global owner script...
ENV properties.mms.user root
ENV properties.mms.pwd  rootroot12345^
ENV properties.mms.port 8080
ENV properties.mms.fqdn localhost


RUN   yum update -y
RUN   yum install -y wget ruby

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

# run migration checks for mms
RUN   curl -O https://raw.githubusercontent.com/desteves/mongodb-release/master/jobs/ops_manager/templates/pre-start.sh
RUN   bash pre-start.sh

# run mms
RUN   wget https://raw.githubusercontent.com/desteves/mongodb-release/master/jobs/ops_manager/templates/ctl.erb
RUN   chmod +x ctl.erb
RUN   bash ctl.erb start

# wait forever.....
#RUN   sleep 5m

# create global owner user
RUN   wget https://raw.githubusercontent.com/desteves/mongodb-release/master/jobs/global_owner/templates/run.sh
RUN   erb properties.mms.user=root properties.mms.pwd=rootroot12345^  properties.mms.port=8080 properties.mms.fqdn=localhost run.sh > run.sh2
RUN   chmod +x run.sh2
RUN   bash run.sh2


CMD ["/bin/bash"]








