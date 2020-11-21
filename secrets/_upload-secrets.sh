#!/bin/sh

cd $(dirname $0)

echo "Generating local docker repository credentials..."

docker login docker.fnptr.net

kubectl create secret generic -n infrastructure regcred \
    --from-file=.dockerconfigjson=$(ls ~/.docker/config.json) \
    --type=kubernetes.io/dockerconfigjson

# Let's make sure the manifest is up to date.
sh _build-manifest.sh

# Plex token
kubectl create secret generic -n media plex-claim-token --from-file=token=media/plex-claim --dry-run=client -o yaml | kubectl apply -f -

# LDAP authbind password
kubectl create secret generic -n infrastructure ldap-authbind --from-file=password=ldap-authbind --dry-run=client -o yaml | kubectl apply -f -

# Matrix PostgreSQL DB Info
kubectl create secret generic -n matrix matrixdb \
--from-literal=POSTGRES_DB=matrixdb \
--from-literal=POSTGRES_USER=matrixdb_user \
--from-literal=LANG=en_US.UTF-8 \
--from-literal=LANGUAGE=en_US:en \
--from-literal=LC_COLLATE=C \
--from-literal=LC_CTYPE=C \
--from-file=POSTGRES_PASSWORD=matrix/matrixdb_password \
--dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f matrix/synapse_config.yaml