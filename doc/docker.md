# docker infos


### docker commands

create volume
```
docker volume create my-vol
```

create volme on external drive
```
docker volume create --driver local \
--opt type=ext4 \
--opt device=/dev/sda3 thename
```

list volumes
```
docker volume ls
```

inspect volume
```
docker volume inspect my-vol
```

remove volume
```
docker volume rm my-vol
```

list networks
```
docker network ls
```

inspect docker container
```
docker inspect
```

stop all container
```
docker stop $(docker ps -a -q)
```

view compose lose
```
docker compose logs 
```

view log of explici container
```
docker logs telegraf
```

docker run
```
docker run -it joind docker container
docker run -d run detached standalone
```

enter docker container
```
sudo docker exec -it influxdb2 /bin/bash
```

execute a command
```
docker run -d --name container-name "ls >> /var/log/test.log"
```
