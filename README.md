# Formula1 Forecast Basic Description and Plan

# Project Description
This project aims to predict Formula 1 teams average lap times based on team performance rather than individual drivers. The goal is to analyze how car quality affects race outcomes by averaging the lap times of both drivers per team, filtering out driver skill differences. By leveraging historical F1 data, the project will develop a machine learning model to predict team lap times and analyze performance trends across seasons.

# Project Goals
1) Predict and comapare 2023/2024 F1 team lap times based on joint driver performance, using historical race data.
2) Evaluate team competitiveness over time by analyzing trends in average team lap times.
3 ) Identify factors influencing lap time variations (i.e. track type, weather, car type).

# Data Collection
The data on races, weather and car data can be pulled from API's but any addiontial data can be find online a scraped with either Beautiful Soup or Selenium (if there is bot blocking software)
API Sources:
Ergast API (http://ergast.com/mrd/) – Provides historical F1 race results, lap times, and team data., https://openf1.org/
fastf1 Python Library – Extracts telemetry and session data for deeper analysis.
Weather APIs – Retrieves race-day weather conditions to analyze external impacts.
Tire data - https://www.f1cfa.com/

# Modeling

This project will use XGBoost for the regression task to predict team lap times based on historical performance data.The model will be trained using features such as qualifying position, weather conditions, track type, and car specifications. TBefore building the model, the Exploratory Data Analysis (EDA) phase will help identify which features are most relevant for predicting lap times. 


# Vizualizating

For data summarization, this project will use line charts to visualize trends in team lap times across multiple seasons, which will allow us to identify how car performance evolves over time. Scatter plots will be used to examine the relationship between qualifying positions and lap times, clarifying the impact of starting positions on race outcomes. A scatter plot comparing predicted lap times to actual lap times will provide insights into the model's accuracy. For model evaluation, feature importance will be visualized using bar charts and residual plots will show the model's prediction errors.

# Testing

To evaluate the model's predictive performance, the project will use an 80/20 train-test split, where 80% of the data will be used for training the model and 20% will be withheld for testing. The project will train the model on historical data from seasons 2015-2022 and test it on data from the 2023/2024 seasons to evaluate how well the model works on recent race conditions. The model’s performance will be evaluated using Root Mean Squared Error (RMSE), as it penalizes larger errors more heavily, which is crucial for tasks like predicting lap times where even small errors (and small time differnces) can be significant. 
