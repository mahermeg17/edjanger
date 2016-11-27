#!/bin/bash
##  Run command "docker exec" with parameters read from edjanger.properties. 
##  File edjanger.properties must be present in path.
##  By default enter in last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --index=INDEX              index of the container name
##  
##  Parameters (edjanger.properties):
##     container_name                 container name
##     docker_command                 show docker command when edjanger is used
##     rm_options                     \"docker rm\" options to a running container
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------

#!/bin/bash
##  Run a container. File edjanger.properties must be present in path.
##  By default run last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                       print this documentation
##  
##         --index=INDEX                index of the container name
##  
##         --command=COMMAND            additionnal command to execute
##  
##  Parameters (edjanger.properties):
##     command_run                      bash command(s) to run
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
###    -h, --help                     print this documentation
###
###        --index=INDEX              index of the container name
###  
###        --shellcommand=COMMAND     shell command to execute
###  
### Internal options:
###
###        --script=SCRIPT            name of the main script
###
###        --command=COMMAND          name of the docker command to execute
###
###        --commandcomment=COMMAND   printed comment of the command to execute
###
###        --commandoptions=OPTIONS   options read in the edjanger.properties
###
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]                     && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

#[ -n "${container_name}" ]                     && commandoptions="${commandoptions} ${container_name}"
[ -n "${command_run}" ]                        && commandoptions="${commandoptions} ${command_run}"
[ -z "${command_run}" ]                        && commandoptions="${commandoptions} /bin/bash"
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
[ -n "$@" ]                                    && externaloptions=$(echo $@ | sed "s|[[:space:]]--|;--|g") \
                                               && externaloptions=$(echo $@ | sed "s|[[:space:]]-|;-|g")
dockerbasiccontainer "--scriptname=\"$0\";--command=\"exec -it {container_name}\";--commandcomment=\"Enter in container: {container_name}...\";${commandoptions};${externaloptions}"

