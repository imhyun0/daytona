#!/bin/bash

WAS_DIR=/home/ec2-user/applications/simpleweb1
WAS_ADM_USER=ec2-user
WORKING_DIR=/home/ec2-user/deploy/target
WAR_FILE=*.war

echo "before_install !!!" >> /home/ec2-user/deploy.log
if ls ${WORKING_DIR}/ 1> deploy.log 2>&1; then
    rm -rf ${WORKING_DIR}
    echo "remove application folder" >> /home/ec2-user/deploy.log
fi

if [ -e ${WAS_DIR}/${WAR_FILE} ]; then
    rm ${WAS_DIR}/${WAR_FILE}
    echo "remove applications folder" >> /home/ec2-user/deploy.log
    # su - ${WAS_ADM_USER} -c "rm ${WAS_DIR}/${WAR_FILE}"
fi
