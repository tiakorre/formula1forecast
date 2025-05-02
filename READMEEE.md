
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

Here's how to complete your **README.md** with the remaining sections:

---

## Visualizations of Data

This project includes static visualizations to help analyze team performance, lap time variability, and model predictions. Notable visualizations include:

- **Line plots** showing average lap time trends for each team across seasons.
- **Scatter plots** visualizing relationships between features like qualifying position, weather conditions, and lap times.
- **Residual plots** to assess model error patterns.
- **Feature importance bar chart** from XGBoost to show which variables (e.g., team, precipitation, circuit type) most affect lap time predictions.

Visualizations were generated using `matplotlib` and `plotly`, with the potential for future upgrades using dashboards like `Dash` or `Streamlit` for full interactivity.

![image](https://github.com/user-attachments/assets/469e00e9-1d1f-4b49-98b3-87e853f07745)
![image](https://github.com/user-attachments/assets/a68d8aaa-86d2-4f45-a138-6335993a9172)



## Description of Data Processing and Modeling

The workflow can be summarized in four main stages:

1. **Data Acquisition & Integration**  
   Pulls from multiple APIs:
   - Ergast API for F1 race data.
   - Weatherbit API for race-day weather.
   - Manually scraped data for other specifics.

2. **Cleaning & Feature Engineering**  
   - Converts lap time strings into total seconds.
   - Handles missing values, normalizes numerical data, and encodes categoricals.
   - Merges multiple sources into a unified dataset per team, per race.

3. **Model Training**  
   - A baseline `LinearRegression` model was established (and discarded).
   - Followed by `XGBoostRegressor` trained on aggregated team-level features and optimized.
   - Categorical features were one-hot encoded for compatibility.

4. **Prediction Pipeline**  
   - Takes in circuit type, weather, and team information.
   - Predicts average lap time for both drivers combined to predict the team average.
   - Evaluated using **MAE** and **R² Score**.



##  Results

The model was evaluated on held-out 2023/2024 data using:

- **MAE (Mean Absolute Error)**: ~10.9 seconds  
- **R² Score**: ~-0.30 (indicating underfitting and room for improvement)

Despite the low R², the model was able to reasonably track performance trends and make predictions within a ~10-second margin. This level of accuracy is promising given the complexity and sensitivity of race performance and the starting non optimized model results which were worse.

**Example Output (Actual vs Predicted Lap Times):**

| Actual Lap Time | Predicted Lap Time | Difference |
|------------------|---------------------|-------------|
| 100.50           | 95.37               | -5.13       |
| 101.77           | 98.78               | -2.99       |
| 105.12           | 99.64               | -5.48       |

![image](https://github.com/user-attachments/assets/409f815a-3abb-4b8a-a858-a0bb6f691607)
![image](https://github.com/user-attachments/assets/a6cbe110-2b6a-445c-93af-a5cae2aa4ab5)





