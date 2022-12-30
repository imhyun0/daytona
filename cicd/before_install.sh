#!/bin/bash

WAS_DIR=/home/ec2-user/applications/
WAS_ADM_USER=ec2-user
WORKING_DIR=/home/ec2-user/deploy/target
WAR_FILE=*.war
WAS_DEPLOY_DIR=/home/ec2-user/applications/simpleweb1

echo "before_install !!!" >> /home/ec2-user/deploy.log
if ls ${WORKING_DIR}/ 1> /dev/null 2>&1; then
    rm -rf ${WORKING_DIR}
    echo "remove deploy target folder" >> /home/ec2-user/deploy.log
fi

if ls ${WAS_DIR} 1> /dev/null 2>&1; then
    rm -rf ${WAS_DIR}
    echo "remove simpleweb1 folder" >> /home/ec2-user/deploy.log
fi

mkdir -vp ${WAS_DIR}
mkdir -vp ${WAS_DEPLOY_DIR}
echo "make dir deploy" >> /home/ec2-user/deploy.log
