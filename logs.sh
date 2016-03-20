#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : logs.sh
# ALIAS            : edockerlogs
# DESCRIPTION      : run command "docker logs" with parameters readed from local edocker.cfg
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerlogs
# ----------------------------------------------------
source {edockerpath}/_common.sh
dockerbasiccontainer "logs" "Logs of container: " "0"
