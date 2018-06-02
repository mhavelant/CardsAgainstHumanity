#!/usr/bin/env bash

pipenv lock --requirements > requirements/base.txt
echo "-r base.txt" > requirements/development.txt
pipenv lock --requirements --dev >> requirements/development.txt
