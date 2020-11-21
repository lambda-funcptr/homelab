#!/bin/sh

cd "$(dirname $0)"

cd docker

for image in $(ls | cat); do
    cd "$image"
    echo "Building docker.fnptr.net/$image";
    docker build --tag docker.fnptr.net/$image .
    docker push docker.fnptr.net/$image
done

docker image prune -f