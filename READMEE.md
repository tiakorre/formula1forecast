# F1 Team Lap Time Prediction Project Midterm Report 

https://www.youtube.com/watch?v=Jx9QwZT7m8U

## Project Description

This project aims to predict Formula 1 teams' average lap times by focusing on team performance—averaging the lap times of both drivers per team—to minimize the impact of individual driver skills. Historical F1 data is leveraged to develop a machine learning model that not only predicts team lap times but also sheds light on performance trends over multiple seasons.

## Project Goals


- **Predict and Compare Team Lap Times:**  
  Use historical race data to predict and compare the 2023/2024 F1 team lap times based on combined driver performance.

- **Evaluate Team Competitiveness Over Time:**  
  Analyze trends in average team lap times across seasons to rank team competitiveness and understand how improvements in car performance influence race outcomes.

- **Identify Influencing Factors:**  
  Determine key variables that impact lap times, such as track type, weather conditions, and car specifications (including tire data and qualifying performance).

## Data Collection

Data for this project is sourced from multiple APIs and online resources:

- **Ergast API (http://ergast.com/mrd/):**  
  Provides historical F1 race data (race results, lap times, and team information) from 1996 onward.

- **Additional Data Sources:**  
  - [OpenF1](https://openf1.org/) and the FastF1 Python Library for telemetry and session data.  
  - Various Weather APIs to capture race-day conditions.  
  - Tire data from sources like [F1CFA](https://www.f1cfa.com/).

Data is gathered via Python scripts in the provided Jupyter Notebook, which queries these sources, processes JSON responses, and structures the data for subsequent analysis.

## Detailed Data Processing

The data processing workflow is critical for transforming raw API data into a structured format suitable for analysis and modeling. The steps implemented in the notebook include:

1. **Data Acquisition and Parsing:**  
   - **API Queries:** Extract data from the Ergast API, OpenF1, FastF1, and weather/tire sources.  
   - **JSON Parsing:** Convert raw JSON responses into structured Python dictionaries/lists for consistent data handling.

2. **Data Cleaning and Transformation:**  
   - **Lap Time Conversion:** Convert lap times from the “M:SS.mmm” format into total seconds using custom parsing functions. This numerical conversion is essential for aggregation and regression modeling.
   - **Missing Value Handling:** Filter out or impute missing or anomalous values to ensure data quality.
   - **Data Type Adjustments:** Standardize numeric fields (e.g., lap times) and categorical fields (e.g., team names, circuits) for consistency.

3. **Aggregation and Merging:**  
   - **Driver-to-Team Mapping:** Map individual driver lap times to their respective teams based on race results.
   - **Multi-Season Aggregation:** A dedicated function (e.g., `circuit_crashes_data`) loops through seasons (2018–2025) to consolidate data into a single pandas DataFrame. Each row represents a team’s performance in a specific race.
   - **Feature Merging:** Integrate supplementary features like circuit details, race dates, and weather data to enrich the dataset.

4. **Final Data Structuring:**  
   - The cleaned and merged data is organized so that each record encapsulates team performance (average lap time) along with contextual features. This structured dataset is then primed for exploratory data analysis (EDA) and model training.

## Detailed Data Modeling Methods

The modeling phase is designed to predict average team lap times through a systematic regression approach. The following details summarize the modeling workflow as implemented in the notebook:

1. **Feature Engineering:**  
   - **Core Features:**  
     - Aggregated lap times (in seconds) for each team.
     - Circuit attributes (like type and latitude) and race date.
     - Categorical variables (such as team and circuit names) are encoded for regression analysis.
   - **Additional Features:**  
     - Planned incorporation of weather conditions and tire data for further refinement.

2. **Model Selection and Baseline Implementation:**  
   - **Baseline Model:**  
     - A linear regression model (using scikit-learn’s `LinearRegression`) is deployed as an initial benchmark and see any patterns.
   - **Data Splitting:**  
     - The dataset is partitioned into training (80%) and testing (20%) subsets. Historical data from 2015–2022 is used for training, with 2023/2024 reserved for testing.
   - **Preprocessing Pipeline:**  
     - Steps will include feature scaling/normalization and encoding of categorical variables, ensuring the model receives appropriately formatted inputs.

3. **Evaluation Metrics:**  
   - **RMSE (Root Mean Squared Error):**  
     - Critical for measuring the average error in predictions—vital given the sensitivity of lap time differences.
   - **R² Score:**  
     - Evaluates the proportion of variance explained by the model.
   
4. **Future Model Enhancements for Final report:**  
   - Transition to advanced methods such as XGBoost is planned to capture nonlinear relationships.
   - Implementation of hyperparameter tuning and cross-validation will further refine model performance and ensure robustness.

![image](https://github.com/user-attachments/assets/1ffde3c1-25c4-4c0e-a20f-a3347e7bc6d6)
![image](https://github.com/user-attachments/assets/fc93f401-fedf-4151-b4a7-333d5e536751)

![image](https://github.com/user-attachments/assets/b5bb8d74-85d3-4bbc-883a-209f0467271b)
![image](https://github.com/user-attachments/assets/41d2f59f-8f62-4486-abf6-318c2fbf41a6)

