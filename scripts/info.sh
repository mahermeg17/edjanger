#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : info.sh
# ALIAS            : edjangerinfo
# DESCRIPTION      : run command "docker info" with parameters readed from local edjanger.properties
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-09-25
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerinfo
# ----------------------------------------------------
source {edjangerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "info"
else
  dockerbasiccontainer "info" "infoping container: " "0" "container" "container"
fi