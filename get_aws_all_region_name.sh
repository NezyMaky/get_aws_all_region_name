#! /usr/bin/env bash

# Copyright (c) [year] [fullname]

# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

SCRIPT_NAME=$(basename $0)
usage () {
  echo "Usage: ${SCRIPT_NAME} [-rh] [-p aws_profile_name]"
}

while getopts p:hr OPT; do
  case $OPT in
    p)  PROFILE="--profile $OPT_ARG"
    ;;
    h)  usage
        exit 0
        ;;
    r)  JQ_OPTION='-r'
        ;;
    \?)  usage
        exit 1
        ;;
  esac
done

aws ec2 describe-regions --all-regions ${PROFILE} | jq ${JQ_OPTION} '.Regions[].RegionName'