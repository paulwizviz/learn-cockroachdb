#!/bin/bash

export COCHDB_EMBED_IMAGE=go-db/cochdbcli:current
export NETWORK=learn-db_cochdb

COMMAND="$1"

function build(){
    docker-compose -f ./build/cochdb/builder.yml build
}

function clean(){
    docker rmi -f ${COCHDB_EMBED_IMAGE}
    docker rmi -f $(docker images --filter "dangling=true" -q)
}

case $COMMAND in
    "build")
        build
        ;;
    "clean")
        clean
        ;;
    "init")
        docker exec -it roach1 ./cockroach init --insecure
        ;;
    "start")
        docker-compose -f ./deployment/docker-compose.yml up
        ;;
    "stop")
        docker-compose -f ./deployment/docker-compose.yml down
        ;;
    *)
        echo "$0 [ build | clean | init | start | stop ]"
        ;;
esac