#!/bin/bash

if [ -e "/usr/local/bin/aws" ]
then
	awsVersion=$(/usr/local/bin/aws --version 2>&amp;1 | /usr/bin/awk -F ' ' '/aws-cli/{ print $1}' | /usr/bin/awk -F / '{ print $2 }')
else
	awsVersion="Not Installed"
fi

echo "&lt;result&gt;$awsVersion&lt;/result&gt;"