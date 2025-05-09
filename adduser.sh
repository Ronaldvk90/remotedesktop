#!/bin/sh

docker exec -it -u 0 remotedesktop-remotedesktop-1 adduser $1
docker exec -it -u 0 remotedesktop-remotedesktop-1 usermod -aG sudo $1
docker exec -it -u 0 remotedesktop-remotedesktop-1 chsh -s /bin/zsh $1
