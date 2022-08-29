#!/usr/bin/env bash

# set -e


for dir in $(ls -d charts/*/); do
  # URLS_OR_PATHS="$(helm dependency list $dir | awk 'NR>1 {print $1 " " $3}')"
  # for v in $URLS_OR_PATHS; do
  #   echo $v
  #   if  [[ $v == http* ]];
  #   then
  #     echo $v
  #   fi
  # done

  helm dependency list $dir 2> /dev/null | awk 'NF { if ($3 ~ /^http/) { print "helm repo add " $1 " " $3 }}'

done