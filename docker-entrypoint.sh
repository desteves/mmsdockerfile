#!/bin/bash

GITHUB_REPO=mms-bosh-release
# run migration checks for mms
curl -O https://raw.githubusercontent.com/desteves/${GITHUB_REPO}/master/jobs/ops_manager/templates/pre-start.sh
bash pre-start.sh

# run mms
wget https://raw.githubusercontent.com/desteves/${GITHUB_REPO}/master/jobs/ops_manager/templates/ctl.erb
chmod +x ctl.erb
bash ctl.erb start

# wait forever.....


# create global owner user...TODO
wget https://raw.githubusercontent.com/desteves/${GITHUB_REPO}/master/jobs/global_owner/templates/run.sh
sed -i "s/USER=.*/USER=root/g" run.sh
sed -i "s/PASS=.*/PASS=rootroot12345^/g" run.sh
sed -i "s/FQDN=.*/FQDN=localhost/g" run.sh
sed -i "s/PORT=.*/PORT=8080/g" run.sh
sed -i "s/MMSG=.*/MMSG=root/g" run.sh
chmod +x run.sh
bash run.sh

exit

