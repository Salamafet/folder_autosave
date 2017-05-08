# folder_autosave
Create backup of folder with simplicity.

This script is make for run everyday with cron job.

All backup older than 31 days are automaticaly deleted except the first backup of each month

------------------

```./foder_autosave.sh [origin] [destination]```

Usage example:
```./folder_autosave.sh /home/user/pictures /media/disk1/backup```

Open the file for change configuration (compression type, remove old backup)

If the backup folder does not exist, it is automatically created

With the previous example, the archive name appear like that: ```16-12-28-pictures.tar```

-------------------

**Next update :**
 -  Translate the help and script comment in english
