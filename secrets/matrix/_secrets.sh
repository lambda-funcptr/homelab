#! /bin/sh

cd "$(dirname $0)"

# Matrix PostgreSQL DB Info
kubectl create secret generic -n matrix matrixdb \
--from-literal=POSTGRES_DB=matrixdb \
--from-literal=POSTGRES_USER=matrixdb_user \
--from-literal=LANG=en_US.UTF-8 \
--from-literal=LANGUAGE=en_US:en \
--from-literal=LC_COLLATE=C \
--from-literal=LC_CTYPE=C \
--from-file=POSTGRES_PASSWORD=matrixdb_password \
--dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f synapse_config.yaml