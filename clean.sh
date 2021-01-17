echo 'Stopping apps'
docker stop mongo rabbit redis

echo 'Cleaning volumes'
echo 'ronsinai20' | sudo -S rm -rf /data/db/* /data/mq/* /data/redis/*

echo 'Restarting apps'
docker restart mongo rabbit redis

echo 'Cleaning images'
docker image prune -f
