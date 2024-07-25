#!/bin/bash


### HOW TO RUN ===> chmod +x bash23/launch26.sh         bash23/launch26.sh

### run from docker file
docker rm -f node23_lb_01
docker rm -f node23_lb_02
docker rm -f node23_lb_03
# docker rm -f node23_lb_04

## -f = specify custom path where docker-compose is located
docker compose -f bash23/docker-compose.yml up --detach             ## to start containers
# docker compose -f bash23/docker-compose.yml logs --follow         ## to see the logs