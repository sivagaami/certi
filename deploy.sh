#!/bin/bash

netstat -plant | grep 8001 | grep Listen
if [ $? != 0 ]; then
nohup python3.7 manage.py runserver 0.0.0.0:8001 > output.log 2>&1 &
exit 0
else
echo "Application already running"
fi
