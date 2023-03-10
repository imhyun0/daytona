#!/bin/bash

WAS_DIR=/home/ec2-user/applications
WAS_ENG_DIR=/usr/local/tomcat8/bin
WAS_ADM_USER=ec2-user
WORKING_DIR=/home/ec2-user/deploy/target
SORC_WAR_FILE=$(ls /home/ec2-user/deploy/target/*.war)
WAR_FILE=simpleweb1.war
WAS_DEPLOY_DIR=/home/ec2-user/applications/simpleweb1

echo "run application_start!!!" >> /home/ec2-user/deploy.log
cp ${SORC_WAR_FILE} ${WAS_DIR}/${WAR_FILE} >> /home/ec2-user/deploy.log
cd ${WAS_DEPLOY_DIR} >> /home/ec2-user/deploy.log
echo `pwd` >> /home/ec2-user/deploy.log
jar -xvf ${WAS_DIR}/${WAR_FILE} >> /home/ec2-user/deploy.log
echo "cp ${SORC_WAR_FILE} ${WAS_DIR}/${WAR_FILE}" >> /home/ec2-user/deploy.log
sudo systemctl start tomcat8
echo "sudo systemctl start tomcat8" >> /home/ec2-user/deploy.log

#chown -R ${WAS_ADM_USER}:${WAS_ADM_USER} ${WORKING_DIR}
#su - ${WAS_ADM_USER} -c "cp ${WORKING_DIR}/${SORC_WAR_FILE} ${WAS_DIR}/${WAR_FILE}"

# tomcat_pid=$(ps -ef | grep tomcat | grep java | awk '{print $2}')
# if [ -n "${tomcat_pid}" ]; then
#     echo "tomcat's PID is ${tomcat_pid}, that is running!!"
#     su - ${WAS_ADM_USER} -c "(${WAS_ENG_DIR}/shutdown.sh)"
# fi

# tomcat_pid=$(ps -ef | grep tomcat | grep java | awk '{print $2}')
# if [ -n "${tomcat_pid}" ]; then
#     echo "shutdown.sh is not working, ${tomcat_pid} should be killed!!"
#     kill -9 ${tomcat_pid}
# fi

# echo "start the tomcat"
# su - ${WAS_ADM_USER} -c "(source ${WAS_ENG_DIR}/startup.sh)"
