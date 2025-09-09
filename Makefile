REQ_FILE   ?= requirements.txt
.PHONY: run run_web install_pack create_req

run:
	@echo "--Running backend--"
	poetry run python C:\USER\Projects\GA-optimization\project\main.py

run_web:
	@echo "--Running frontend--"
	poetry run python -m project\web_application.web_app

install:
	@echo "➜ Installing packages"
	poetry install

generate_requitements_file:
	@echo "➜ Creating requirements.txt"
	poetry export -f requirements.txt --output $(REQ_FILE) --without-hashes
remove_before_setup:
	powershell -Command "if (Test-Path 'venv') { Remove-Item -Recurse -Force 'venv' }"
	powershell -Command "if (Test-Path 'poetry.lock') { Remove-Item -Force 'poetry.lock' }"
	powershell -Command "if (Test-Path 'pyproject.toml') { Remove-Item -Force 'pyproject.toml' }"
setup:
	python -m venv venv
	.\venv\Scripts\python -m pip install --upgrade pip
	.\venv\Scripts\python -m pip install poetry
	poetry init --no-interaction --name project --dependency requests
	poetry config virtualenvs.create false --local
	poetry cache clear --all pypi --no-interaction