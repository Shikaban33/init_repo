REQ_FILE   ?= requirements.txt
.PHONY: run install generate_requitements_file cleanup clean_cache setup setup_formatting

run:
	@echo "--Running backend--"
	poetry run python project\app.py

install:
	@echo "➜ Installing packages"
	poetry install

generate_requitements_file:
	@echo "➜ Creating requirements.txt"
	poetry export -f requirements.txt --output $(REQ_FILE) --without-hashes

cleanup: clean_cache
	powershell -Command "if (Test-Path 'venv') { Remove-Item -Recurse -Force 'venv' }"
	powershell -Command "if (Test-Path 'poetry.lock') { Remove-Item -Force 'poetry.lock' }"
	powershell -Command "if (Test-Path 'pyproject.toml') { Remove-Item -Force 'pyproject.toml' }"
	powershell -Command "if (Test-Path 'poetry.toml') { Remove-Item -Force 'poetry.toml' }"

clean_cache:
	@echo "Cleaning Poetry cache..."
	poetry cache clear --all pypi --no-interaction
	@echo "Removing __pycache__ folders..."
	find . -type d -name "__pycache__" -exec rm -rf {} +
	@echo "Removing .pytest_cache folders..."
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	@echo "Cache cleanup done."

setup:
	python -m venv venv
	.\venv\Scripts\python -m pip install --upgrade pip
	.\venv\Scripts\python -m pip install poetry
	poetry init --no-interaction --name project --dependency requests
	poetry config virtualenvs.create false --local
	poetry cache clear --all pypi --no-interaction

setup_formatting:
	poetry add --dev flake8 black pre-commit isort --no-interaction -vv
	poetry run pre-commit install




