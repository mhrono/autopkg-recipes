#!/bin/bash

if [ -e "/usr/local/bin/sdm" ]
then
	sdmVersion=$(/usr/local/bin/sdm --version | awk '{print $3}')
else
	sdmVersion="Not Installed"
fi

echo "<result>$sdmVersion</result>"