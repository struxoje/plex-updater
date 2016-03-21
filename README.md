# plex-updater
Simple Plex Media Server Auto updater for Ubuntu64

Its super simple and straight forward.

Script works as follows:
- Checks currently installed and latest version available on plex site
- if there is a mismatch downloads and installs new version
- removes installation file

You should add it to crontab for scheduling. Here is an example of running it daily at 5am:
00 05 * * * /srv/scripts/./plex-updater.sh

Don't forget to include paths in your cron file, you will need them for successful installation
PATH=/usr/bin:/bin:/usr/sbin:/sbin

If you want you can push output to log
00 05 * * * /srv/scripts/./plex-updater.sh >> /var/log/plex-updater.log 2>&1
