
all: check

help:
	@echo "Available targets:"
	@echo "- help                   Show this help message"
	@echo "- bootstrap              Installs required dependencies"
	@echo "- check                  Runs static code analyzers"

bootstrap:
	poetry --version || curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
	poetry install

check: pylint mypy

pylint:
	poetry run pylint --exit-zero flask_pyctuator

mypy:
	poetry run mypy -p flask_pyctuator

package:
	poetry build
	
.PHONY: all help bootstrap check test coverage pylint mypy package clean
