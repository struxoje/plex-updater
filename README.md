# plex-updater
Simple Plex Media Server Auto updater for Ubuntu64

Check installed vs. available version, if new is found, installs it.
Add it to crontab for automatic updates. You can run it daily at 5am by adding following to chrontab:
00 05 * * * /srv/scripts/./plex-updater.sh

Don't forget to include paths in your cron file
PATH=/usr/bin:/bin:/usr/sbin:/sbin

If you want you can push output to log
00 05 * * * /srv/scripts/./plex-updater.sh >> /var/log/plex-updater.log
