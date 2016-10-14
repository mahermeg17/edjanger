#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : stop.sh
# ALIAS            : edockerstop
# DESCRIPTION      : run command "docker stop" with parameters readed from local edocker.${config_extension}
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : stop_options
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerstop
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "stop"
else
  dockerbasiccontainer "stop ${stop_options}" "Stopping container: " "0" "container" "container"
fi
