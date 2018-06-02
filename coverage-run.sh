#!/usr/bin/env bash
cd src
coverage run --rcfile=../.coveragerc manage.py test
coverage report --rcfile=../.coveragerc
coverage html --rcfile=../.coveragerc

coverage-badge -f -o ../coverage.svg

read -n 1 -p "Press a button.."
