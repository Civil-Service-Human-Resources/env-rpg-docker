#!/bin/bash

export docker_image=cshrrpg.azurecr.io/java-8-base
export docker_tag=$(uuidgen)

docker build --tag ${docker_image}:${docker_tag} \
    --file ../Dockerfile \
	--build-arg arg_build_branch=$(git rev-parse --abbrev-ref HEAD) \
	--build-arg arg_build_project=cshr \
	--build-arg arg_built_by=$(whoami)
