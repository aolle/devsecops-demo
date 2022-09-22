#!/bin/bash

set -e -u -o pipefail

valid_command() {
  local fn=$1; shift
  [[ $(type -t "$fn") == "function" ]]
}

info() {
    printf "\n# INFO: $@\n"
}

err() {
  printf "\n# ERROR: $1\n"
  exit 1
}

info "Installing prerequisites"

pip3 install --user ansible
ansible-galaxy collection install community.kubernetes
pip3 install --user kubernetes jmespath
