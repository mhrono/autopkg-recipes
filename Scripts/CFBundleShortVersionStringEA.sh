#!/bin/sh

## Read application CFBundleShortVersionString
CFBundleShortVersionString=""
if [ -f "/Applications/%NAME%.app/Contents/Info.plist" ]; then
	CFBundleShortVersionString=$(defaults read "/Applications/%NAME%.app/Contents/Info.plist" CFBundleShortVersionString)
fi
echo "<result>$CFBundleShortVersionString</result>"