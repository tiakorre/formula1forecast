
# Formula 1 Lap Time Predictor

## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Git

### Installation
```bash
git clone https://github.com/tiakorre/formula1forecast.git
cd formula1forecast

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
.\venv\Scripts\activate  # Windows

# Install dependencies
pip install -r requirements.txt
```

## Usage

### Train Model
```bash
python src/train.py --data=data/raw/ --output=models/
```

### Make Predictions
```bash
python src/predict.py --model=models/model.joblib --input=data/processed/test.csv
```

## Testing
```bash
# Run unit tests
pytest tests/

# Or via Makefile
make test
```

## CI/CD Pipeline
GitHub Actions automatically runs on push/PR:
1. Installs dependencies
2. Runs tests
3. Verifies predictions



