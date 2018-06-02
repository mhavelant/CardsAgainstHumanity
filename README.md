# Cards Against Humanity in Django

This is a toy project for practicing Django.

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
