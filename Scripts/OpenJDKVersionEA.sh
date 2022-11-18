#!/bin/zsh

openjdkVersion="$(defaults read "${$(/usr/libexec/java_home)%/*}/Info" CFBundleShortVersionString 2>/dev/null || echo 'Not Installed')"

echo "<result>$openjdkVersion</result>"