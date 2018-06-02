#!/usr/bin/env bash
cd src
coverage run --rcfile=../.coveragerc --timid manage.py test
coverage report --rcfile=../.coveragerc
coverage html --rcfile=../.coveragerc --directory=../coverage/html

coverage-badge -f -o ../coverage.svg
