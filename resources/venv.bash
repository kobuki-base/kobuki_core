#!/bin/bash

# Script for setting up a standalone development environment that
# builds kobuki and it's dependencies from source (i.e. no
# binary installation environment needed).
#
# a) creates a python virtual environment in ./.venv
# b) pip3 installs colcon-core, colcon-common-extensions and vcstools
#
# To be used with kobuki_core/resources/kobuki_standalone.repos.
#

##############################################################################
# Directories
##############################################################################

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
VENV_DIR=${SRC_DIR}/.venv

##############################################################################
# Colours
##############################################################################

BOLD="\e[1m"
CYAN="\e[36m"
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

padded_message () {
  line="........................................"
  printf "%s %s${2}\n" ${1} "${line:${#1}}"
}

pretty_header () {
  echo -e "${BOLD}${1}${RESET}"
}
pretty_print () {
  echo -e "${GREEN}${1}${RESET}"
}
pretty_warning () {
  echo -e "${YELLOW}${1}${RESET}"
}
pretty_error () {
  echo -e "${RED}${1}${RESET}"
}

#############################
# Checks
#############################

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && SOURCED=1
if [ -z "$SOURCED" ]; then
  pretty_error "This script needs to be sourced, i.e. source './setup.bash', not './setup.bash'"
  exit 1
fi

#############################
# Virtual Env
#############################

pretty_header "Virtual Environment"

if [ -x ${VENV_DIR}/bin/pip3 ]; then
    pretty_print "  $(padded_message "virtual_environment" "found [${VENV_DIR}]")"
else
    python3 -m venv ${VENV_DIR}
    pretty_warning "  $(padded_message "virtual_environment" "created [${VENV_DIR}]")"
fi

source ${VENV_DIR}/bin/activate

#############################
# Pypi Dependencies
#############################

pretty_header "PyPi Dependencies"

pip3 install wheel
pip3 install setuptools==45.2.0
pip3 install vcstool==0.2.14
pip3 install colcon-core==0.6.0
pip3 install colcon-common-extensions==0.2.1

echo ""
echo "Leave the virtual environment with 'deactivate'"
echo ""
echo "I'm grooty, you should be too."
echo ""

