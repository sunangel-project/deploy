#!/usr/bin/env sh

cd deploy

git pull

./deploy-$(hostname).sh
