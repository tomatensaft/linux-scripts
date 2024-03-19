# docker commands


### general commands
general docker commands

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

view log of explicit container
```
docker logs telegraf
```

docker run (create and start) with console
```
docker run -v $(pwd):/root -it influxdb2 /bin/bash
docker run -it influxdb2 --entrypoint /usr/local/bin/bash bash
```

docker run (create and start) detached
```
docker run -d influxdb2
```

docker only start container
```
docker start influxdb2
```

docker onyl stop container
```
docker stop influxdb2
```

enter docker container / join container
```
sudo docker exec -it influxdb2 /bin/bash
```

execute a command
```
docker run -d --name influxdb2 "ls >> /var/log/test.log"
```
