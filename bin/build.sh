#!/bin/bash
##
# Build images with RPG labels
# Usage eg ./build.sh java-8-base uid

function usage {
	echo "Usage: ${BASH_SOURCE[0]} <image> <tag>" 	
	echo "eg: ${BASH_SOURCE[0]} java-8-base 1234-dbfg-5652-hshgd"
	exit 0	
}

if [[ ${#} -lt 2 ]]; then
	usage
fi

bin_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker_dir="$(dirname ${bin_dir})"

export docker_image=cshrrpg.azurecr.io/${1}
export docker_tag=${2}

docker build --tag ${docker_image}:${docker_tag} \
    --build-arg arg_build_date=$(date +"%Y%m%d_%H-%M_%S") \
	--build-arg arg_build_branch=$(git rev-parse --abbrev-ref HEAD) \
	--build-arg arg_build_project=env-rpg-docker \
	--build-arg arg_built_by=$(whoami) ${docker_dir}/${1}/
