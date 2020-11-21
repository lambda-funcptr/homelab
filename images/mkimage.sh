#!/bin/sh

cd "$(dirname $0)"


rm -r logs
mkdir -p logs

cd docker

build_image() {
    if [ -e "../logs/$@" ]; then
        echo "Skipping docker image \"$@\", already up-to-date."
        return;
    fi

    cd "$@"
    echo "Building docker.fnptr.net/$@";
    docker build --tag docker.fnptr.net/$@ . > ../../logs/$@
    docker push docker.fnptr.net/$@
    cd ..
}

for image in $(ls | cat); do
    IMAGE_DEPENDS=$(cat $image/depends)
    for dependency in $IMAGE_DEPENDS; do
        build_image $dependency
    done
    build_image $image
done

docker image prune -f