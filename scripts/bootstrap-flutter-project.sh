#!/bin/bash
if cat pubspec.yaml | grep name: ; then
  echo "Project already initialized"
else 
  echo "Enter the projects name: (snakecase)"
  SNAKE_PAT='^[a-z]+((_[a-z]+)*)$'
  read PROJECT_NAME
  if [[ $PROJECT_NAME =~ $SNAKE_PAT ]]; then
      echo "passou"
    else
      echo "Invalid dart project name!"; exit
  fi
  echo "Now enter the projects description:"
  read PROJECT_DESCRIPTION
  echo "description: $PROJECT_DESCRIPTION" | cat - pubspec.yaml > temp && mv temp pubspec.yaml
  echo "name: $PROJECT_NAME" | cat - pubspec.yaml > temp && mv temp pubspec.yaml
  bash scripts/fvm-run.sh flutter create .
fi
