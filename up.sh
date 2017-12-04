#!/bin/bash
# Run docker-compose up, selecting appropriate files automatically

compose_str="docker-compose up -f docker-compose.yaml"

# Linux or not?
# Linux systems require that we set ulimit memlock to -1
if [[ $(uname) == "Linux" ]]
then
	compose_str="${compose_str} -f docker-compose-linux.yaml"
fi

# Development mode?
# If KALE_SRC is set, local kale files will be mounted (linked) 
# as a volume in docker container.
# Otherwise, we'll do a git pull from the github repo.
if [[ -n ${KALE_SRC} ]]
then
	compose_str="${compose_str} -f docker-compose-dev.yaml"
else
	compose_str="${compose_str} -f docker-compose-git.yaml"
fi

echo $compose_str
	
