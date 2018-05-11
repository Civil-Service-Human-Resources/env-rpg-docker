#!/bin/bash
##
# Build images with RPG labels
# Usage eg ./build.sh java-8-base uid

export docker_image=cshrrpg.azurecr.io/${1}
export docker_tag=${2}

docker build --tag ${docker_image}:${docker_tag} \
	--build-arg arg_build_branch=$(git rev-parse --abbrev-ref HEAD) \
	--build-arg arg_build_project=env-rpg-docker \
	--build-arg arg_built_by=$(whoami) ../