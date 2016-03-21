#!/bin/bash
# Author: Adnan Strujic
# Email: astrujic@gmail.com
# Date: March 2016
# License: Apache License 2.0 - http://www.apache.org/licenses/

INSTALLED_VER="$(apt-cache show plexmediaserver | awk '/Version/ {print $2}')"
LATEST_VER="$(curl -s https://plex.tv/downloads | grep -Po '(?<=plexmediaserver_).*?(?=_amd64\.deb)')"
INSTALL_FILE="plexmediaserver_"$LATEST_VER"_amd64.deb"
INSTALL_FOLDER="/srv/scripts/"

echo "Starting plex updater: $(date)"

# Instead of checking all subversions, assumption here is simple, if there is a version mistmatch get and install new version
if [ "$INSTALLED_VER" != "$LATEST_VER" ]
then
# Download new version
wget -P $INSTALL_FOLDER 'https://downloads.plex.tv/plex-media-server/'$LATEST_VER'/'$INSTALL_FILE
# Install new version
dpkg -i $INSTALL_FOLDER$INSTALL_FILE
# Remove installation file
rm $INSTALL_FOLDER$INSTALL_FILE
else
echo "You already have latest version: "$INSTALLED_VER
fi
