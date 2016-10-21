#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : history.sh
# ALIAS            : edockerhistory
# DESCRIPTION      : history command "docker history", with parameters readed from local edocker.${config_extension}
#   PARAMETER      : history_options
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-09-25
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerhistory
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 history
else
  if [ ! -f edocker.${config_extension} ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_config
    idx=$(echo "$(docker ps | grep ${container_name} | wc -l)+1" | bc)
    echo "history container_name: ${container_name}_${idx}..."
    docker history ${history_options} ${container_name}_${idx}
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker history ${history_options} ${container_name}_${idx}"
    fi
  fi
fi