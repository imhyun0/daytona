#!/bin/bash

WAS_DIR=/home/ec2-user/applications
WAS_ADM_USER=ec2-user
WORKING_DIR=/home/ec2-user/deploy/target
WAR_FILE=*.war

echo "before_install !!!"
if ls ${WORKING_DIR}/ 1> deploy.log 2>&1; then
    rm -rf ${WORKING_DIR} >> deploy.log
fi

if [ -e ${WAS_DIR}/${WAR_FILE} ]; then
    rm ${WAS_DIR}/${WAR_FILE} >> deploy.log
    # su - ${WAS_ADM_USER} -c "rm ${WAS_DIR}/${WAR_FILE}"
fi
