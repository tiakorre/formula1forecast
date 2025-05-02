# Makefile - For GitHub Actions/Workflows

# Variables
VENV_NAME := venv
PYTHON := $(VENV_NAME)/bin/python
PIP := $(VENV_NAME)/bin/pip

# Detect OS
ifeq ($(OS),Windows_NT)
	PYTHON := $(VENV_NAME)/Scripts/python
	PIP := $(VENV_NAME)/Scripts/pip
endif

.PHONY: init train predict clean

init:
	@echo "Creating virtual environment..."
	python -m venv $(VENV_NAME)
	@echo "Installing dependencies..."
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

train:
	@echo "Training model..."
	$(PYTHON) src/train.py --data_path=data/raw/ --model_path=models/

predict:
	@echo "Making predictions..."
	$(PYTHON) src/predict.py --model=models/model.joblib --input=data/processed/test.csv

test:
	$(PYTHON) -m pytest tests/

clean:
	@echo "Cleaning project..."
	rm -rf __pycache__
	rm -rf $(VENV_NAME)
	rm -rf .pytest_cache
	find . -name "*.pyc" -exec rm -f {} \;
