#!/bin/bash
##
# Build the wordpress image and pass in relevant build params
##

docker build -t cshrrpg.azurecr.io/wordpress:4.9.4-apache . \
	--build-arg arg_build_branch=$(git rev-parse --abbrev-ref HEAD) \
	--build-arg arg_build_project=cshr \
	--build-arg arg_built_by=$(whoami) \
	--build-arg arg_build_workspace=env-rpg-platform
