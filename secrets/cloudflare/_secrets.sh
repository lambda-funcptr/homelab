#!/bin/sh

cd "$(dirname $0)"

kubectl apply -f cloudflare-api-token-secret.yaml