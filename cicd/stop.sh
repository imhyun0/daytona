#!/bin/bash
WAS_ENG_DIR=/usr/local/tomcat8/bin
WAS_ADM_USER=ec2-user

echo "application_stop!!!"

if [ -d /home/ec2-user/deploy ]; then
    sudo rm -rf /home/ec2-user/deploy/
fi
    sudo mkdir -vp /home/ec2-user/deploy/

sudo systemctl stop tomcat8


# su - $WAS_ADM_USER -c "(source ${WAS_ENG_DIR}/shutdown.sh)"

# tomcat_pid=$(ps -ef | grep tomcat | grep java | awk '{print $2}')
# if [ -n "${tomcat_pid}" ]; then
#     echo "tomcat's PID is ${tomcat_pid}, that is running!!"
#     su - ${WAS_ADM_USER} -c "(${WAS_ENG_DIR}/shutdown.sh)"
# fi

# tomcat_pid=$(ps -ef | grep tomcat | grep java | awk '{print $2}')
# if [ -n "${tomcat_pid}" ]; then
#     echo "stop.sh is not working, ${tomcat_pid} should be killed!!"
#     kill -9 ${tomcat_pid}
# fi
