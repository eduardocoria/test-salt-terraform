/home/ubuntu/logger.sh:
  cron.present:
    - user: root
    - minute: '0,30'
