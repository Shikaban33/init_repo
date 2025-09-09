### Automatic setup ###
After installing and configuring (make) run:
-- make remove_before_setup
-- make setup
-- make install

# Create venv
Create venv
-- python -m venv venv

# Project
Install all packages:
-- make install_pack

# Poetry
Install poetry:
-- pip install poetry

Init pyptoject.toml:
-- poetry init

Force poetry to use venv:
-- poetry config virtualenvs.create false --local

Import from requirements.txt:
-- poetry add $(Get-Content requirements.txt)

To add packages to poetry (example: pandas):
-- poetry add pandas

# Additional commands:
Check if venv activated:
-- Get-Command python | Select-Object Source

Bring venv indicator:
-- .\venv\Scripts\Activate

Install make: (use admin)
-- choco install make -y

