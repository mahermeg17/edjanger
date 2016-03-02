#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------

if [ ! -f edocker.cfg ]; then
  echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
else
  source edocker.cfg
  echo build image_name: ${image_name}...
  if [ ! -d ${build_path} ]; then
    echo "Build path must exist and be a folder, configure variable build_path in edocker.cfg"
  else
    . {edockerpath}/_proxy.sh
    build_arguments="${proxy_args} ${build_args}"
    docker build -t ${image_name} ${build_arguments} ${build_path}
    build_arguments=""
    . {edockerpath}/_proxy_reset.sh
  fi
fi
