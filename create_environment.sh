#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Name of the environment was not supplied - using covid_pes as environment name"
  NAME="covid_pes"
else
  NAME=$1
fi

echo "Environment name: ${NAME}"

eval "$(conda shell.bash hook)" &&
conda activate base &&
conda env remove --name ${NAME} &&
conda env create --name ${NAME} -f environment.yml &&
conda activate ${NAME} &&
echo "INSTALLED" || echo "ERROR"


