
# Formula 1 Lap Time Predictor

## Quick Start

###Youtube Video
https://youtu.be/BNk5uKYLSh8?si=XckYF_pFFUd5K0iY

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

 
Project Description
This project aims to predict Formula 1 teams' average lap times by focusing on team performance—averaging the lap times of both drivers per team—to minimize the impact of individual driver skills. Historical F1 data is leveraged to develop a machine learning model that not only predicts team lap times but also sheds light on performance trends over multiple seasons.

Project Goals
Predict and Compare Team Lap Times:
Use historical race data to predict and compare the 2023/2024 F1 team lap times based on combined driver performance.

Evaluate Team Competitiveness Over Time:
Analyze trends in average team lap times across seasons to rank team competitiveness and understand how improvements in car performance influence race outcomes.

Identify Influencing Factors:
Determine key variables that impact lap times, such as track type, weather conditions, and car specifications (including tire data and qualifying performance).


Detailed Data Processing
The data processing workflow is critical for transforming raw API data into a structured format suitable for analysis and modeling. The steps implemented in the notebook include:

Data Acquisition and Parsing:

API Queries: Extract data from the Ergast API, OpenF1, FastF1, and weather/tire sources.
JSON Parsing: Convert raw JSON responses into structured Python dictionaries/lists for consistent data handling.
Data Cleaning and Transformation:

Lap Time Conversion: Convert lap times from the “M:SS.mmm” format into total seconds using custom parsing functions. This numerical conversion is essential for aggregation and regression modeling.
Missing Value Handling: Filter out or impute missing or anomalous values to ensure data quality.
Data Type Adjustments: Standardize numeric fields (e.g., lap times) and categorical fields (e.g., team names, circuits) for consistency.
Aggregation and Merging:

Driver-to-Team Mapping: Map individual driver lap times to their respective teams based on race results.
Multi-Season Aggregation: A dedicated function (e.g., circuit_crashes_data) loops through seasons (2018–2025) to consolidate data into a single pandas DataFrame. Each row represents a team’s performance in a specific race.
Feature Merging: Integrate supplementary features like circuit details, race dates, and weather data to enrich the dataset.
Final Data Structuring:

The cleaned and merged data is organized so that each record encapsulates team performance (average lap time) along with contextual features. This structured dataset is then primed for exploratory data analysis (EDA) and model training.
Detailed Data Modeling Methods
The modeling phase is designed to predict average team lap times through a systematic regression approach. The following details summarize the modeling workflow as implemented in the notebook:

RMSE (Root Mean Squared Error):
Critical for measuring the average error in predictions—vital given the sensitivity of lap time differences.
R² Score:
Evaluates the proportion of variance explained by the model.

## Visualizations of Data

This project includes static visualizations to help analyze team performance, lap time variability, and model predictions. Notable visualizations include:

- **Line plots** showing average lap time trends for each team across seasons.
- **Scatter plots** visualizing relationships between features like qualifying position, weather conditions, and lap times.
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





