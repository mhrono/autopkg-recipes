#!/bin/bash

if [ -e "/usr/local/bin/aws" ]
then
	awsVersion=$(/usr/local/bin/aws --version | awk '{print $1}' | awk -F'/' '{print $2}')
else
	awsVersion="Not Installed"
fi

echo "<result>$awsVersion</result>"