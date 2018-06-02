# Cards Against Humanity in Django

[![Build Status](https://travis-ci.org/hamtaai/CardsAgainstHumanity.svg?branch=master)](https://travis-ci.org/hamtaai/CardsAgainstHumanity)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Coverage](coverage.svg)](https://github.com/hamtaai/CardsAgainstHumanity)
[![Python Version](https://img.shields.io/badge/python-3.6-blue.svg)](https://github.com/hamtaai/CardsAgainstHumanity)
[![Django Version](https://img.shields.io/badge/django-2.0-blue.svg)](https://github.com/hamtaai/CardsAgainstHumanity)

This is a toy project for practicing Django. It is not intended to ever reach a production-ready state.

If you want a production-ready CAH-clone, please visit [Pretend You're Xyzzy](https://github.com/ajanata/PretendYoureXyzzy).

## Project info
* Python 3.6.5 and Django 2
* I'm using the [Edge](https://github.com/arocks/edge) template

## Setup (untested)
* Clone the repo
* cd {porject folder}
* pipenv install --dev
* pipenv shell
* cd src
* cp CardsAgainstHumanity/settings/local.sample.env CardsAgainstHumanity/settings/local.env
* python manage.py migrate
* python manage.py createsuperuser

@todo: finish, test, etc.

## Misc
* For reference, the template-generated readme can be found here: [README](docs/TEMPLATE-README.md)
* PIPENV_VENV_IN_PROJECT=true is needed to have a project-specific .venv
  * Note, to set the venv path globally, WORKON_HOME can be used
  * See: [pipenv docs](http://pipenv.readthedocs.io/en/latest/advanced/#custom-virtual-environment-location)
