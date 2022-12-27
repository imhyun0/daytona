#!/bin/bash

WAS_DIR=/home/ec2-user/applications
WAS_ENG_DIR=/usr/local/tomcat8/bin
WAS_ADM_USER=ec2-user
WORKING_DIR=/home/ec2-user/deploy
SORC_WAR_FILE=$(ls /home/ec2-user/deploy/*.war)
WAR_FILE=simpleweb1.war

echo "run application_start!!!"
chown -R ${WAS_ADM_USER}:${WAS_ADM_USER} ${WORKING_DIR}
su - ${WAS_ADM_USER} -c "cp ${WORKING_DIR}/${SORC_WAR_FILE} ${WAS_DIR}/${WAR_FILE}"

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
