#!/bin/sh

docker exec -it -u 0 remotedesktop-remotedesktop-1 deluser $1 --remove-home
