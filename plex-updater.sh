#!/bin/bash
# Date: August 2021
# License: Apache License 2.0 - http://www.apache.org/licenses/

INSTALLED_VER="$(apt-cache show plexmediaserver | awk '/Version/ {print $2}')"
LATEST_VER="$(curl -s https://plex.tv/api/downloads/5.json | jq -r '.computer.Linux.version')"
INSTALL_FILE="plexmediaserver_"$LATEST_VER"_amd64.deb"
INSTALL_FOLDER="/srv/"

echo "Starting plex updater: $(date)"

# Instead of checking all subversions, assumption here is simple, if there is a version mistmatch get and install new version
if [ "$INSTALLED_VER" != "$LATEST_VER" ]
then
# Download new version
wget -P $INSTALL_FOLDER 'https://downloads.plex.tv/plex-media-server-new/'$LATEST_VER'/debian/'$INSTALL_FILE

# Install new version
dpkg -i $INSTALL_FOLDER$INSTALL_FILE
# Remove installation file
rm $INSTALL_FOLDER$INSTALL_FILE
else
echo "You already have latest version: "$INSTALLED_VER
fi
