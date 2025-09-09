# Automatic Setup

This guide explains how to set up the project automatically using `make`, Python virtual environments, and Poetry.

---

## Automatic Setup

After installing and configuring `make`, run:

```bash
make remove_before_setup
```
```bash
make setup
```
In cmd or powershell activate venv:
```bash
.\venv\Scripts\Activate.ps1
```
```bash
.\venv\Scripts\activate.bat
```
```bash
make setup_formatting
```
Try out tests:
```bash
poetry add pytest
```
```bash
poetry run pytest
```
---

## Create Virtual Environment (venv)

Create a virtual environment:

```bash
python -m venv venv
```

Activate it to bring up the venv indicator:

```bash
.\venv\Scripts\Activate
```

Check if the correct Python is active:

```bash
Get-Command python | Select-Object Source
```

---

## Project Packages

Install all required packages:

```bash
make install_pack
```

---

## Poetry

### Install Poetry

```bash
pip install poetry
```

### Initialize `pyproject.toml`

```bash
poetry init
```

### Force Poetry to use the current venv

```bash
poetry config virtualenvs.create false --local
```

### Import packages from `requirements.txt`

```bash
poetry add $(Get-Content requirements.txt)
```

### Add packages manually (example: pandas)

```bash
poetry add pandas
```

---

## Additional Commands

### Activate venv and show indicator

```bash
.\venv\Scripts\Activate.ps1
```

### Install make (requires admin)

```bash
choco install make -y
```

### Run tests

```bash
poetry add pytest
```
```bash
poetry run pytest
```