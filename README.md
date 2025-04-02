
# ai_weather
🌦 AI Weather App is a smart application that provides real-time weather updates, including temperature, humidity, UV index, and rain probability, along with a 3-day weather forecast.

🤖 The app integrates AI-powered predictions to help users decide whether it's a good time to go out based on the expected weather conditions, making daily planning easier and more accurate!

## Table of contents
- ### [Setting Up The Local Server =>](#setting)up_the_local_server)
- ### [main packages used =>](#main-packages-used)
- ### [Folder structure =>](#folder-structure)
- ### [Screenshots =>](#screenshots)
- ### [Demo video =>](#demo-video)


## Setting Up The Local Server
1-Run these commands in the terminal

### windows
python -m venv venv
venv\Scripts\activate.bat
Set-ExecutionPolicy Unrestricted -Scope Process
venv\Scripts\Activate.ps1

### Mac
python3 -m venv venv
source venv/bin/activate
/////////////////////
pip install Flask

pip show Flask

pip install numpy

pip install scikit-learn==1.3.2

python app.py

python app.py // to host the AI model and access it through your local host on port 5001.

2- check if your file sucess host success or not by try this IP ('http://127.0.0.1:5001') in your browser.

3- Send your list to the model using POST method use this IP : ('http://10.0.2.2:5001/predict') in your flutter app.

## Main packages used

- [go_router](https://pub.dev/packages/go_router) to manage app navigation
- [firebase_core](https://pub.dev/packages/firebase_core) to initialize Firebase
- [firebase_auth](https://pub.dev/packages/firebase_auth) to handle authentication
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [dartz](https://pub.dev/packages/dartz) for functional programming utilities
- [get_it](https://pub.dev/packages/get_it) for dependency injection
- [shared_preferences](https://pub.dev/packages/shared_preferences) for local data caching
- [intl](https://pub.dev/packages/intl) to format dates
- [percent_indicator](https://pub.dev/packages/percent_indicator) to visualize weather data percentages
- [dio](https://pub.dev/packages/dio) for API integration
- [location](https://pub.dev/packages/location) to get the user's location


## Folder structure
We have applied clean archeticture ,MVVM (Feature Based)  concept and here is the basic folder structure:

core folder structure that flutter provides:
```
booking_app
├── android
├── assets
├── build
├── ios
├── lib
└── test
```
Here is the folder structure we have been using in this project:
```
docs
├── auth_feature.md
├── geo_weather_feature.md
└── get_prediction.md

lib

├── core
├── featuers
└── main.dart
```
### core
This folder contains all services and tools related to the application
```
core
├── app_router
├── di                      
├── error
├── helper
├── location       
├── network                 
├── styles               
└── utils                   
```
### features
This folder containes everything related to the screen of the application and the business logic of the application specificly state management.
```
presentation
├── auth
├── home
```


## Demo Video
https://github.com/user-attachments/assets/9ddd4164-3d5c-4c98-a830-40814e2d52ba

# GetPrediction Demo
https://github.com/user-attachments/assets/3aa79804-f9d4-40ed-bec2-0ec52deddde7
# GeoWeather feature Demo


https://github.com/user-attachments/assets/d7d8460a-6578-47ac-86b3-64ff265f975c


# AuthFeature Demo
https://github.com/user-attachments/assets/411a344c-b09c-4c5a-b057-73c268ecd726






