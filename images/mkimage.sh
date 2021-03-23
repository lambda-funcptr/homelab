#!/bin/bash

set -e 

PUSH=false

cd "$(dirname $0)"

if [ "$1" != "push" ]; then
    echo "Not pushing images to registry. Use \"./mkimage.sh push\" to push to registry.";
else
    echo "Pushing images to registry, please log in."
    docker login harbor.fnptr.net;
    PUSH=true
fi

rm -r logs
mkdir -p logs

build_image() {
    if [ -e "logs/$@" ]; then
        echo "Skipping docker image \"$@\", already up-to-date."
        return;
    fi
    
    mkdir -p logs/$@

    echo "Building harbor.fnptr.net/$@";
    docker build --tag harbor.fnptr.net/$@ docker/$@ > logs/$@/logs
    if [ "$PUSH" == true ]; then
        echo "Pushing image $@ to harbor..."
        docker push harbor.fnptr.net/$@
    fi
}

for DOCKERFILE in $(find docker -name "Dockerfile" -type f); do
    IMAGE_TAG="$(dirname $DOCKERFILE | cut -d'/' -f2-)"
    IMAGE_DEPENDS="";
    if [[ -e docker/$IMAGE_TAG/depends ]]; then
        IMAGE_DEPENDS=$(cat docker/$IMAGE_TAG/depends)
    fi
    for DEPENDENCY in $IMAGE_DEPENDS; do
        build_image $DEPENDENCY
    done
    build_image $IMAGE_TAG
done

docker image prune -f