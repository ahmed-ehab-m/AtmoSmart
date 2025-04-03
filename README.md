
# ai_weather
🌦 AI Weather App is a smart application that provides real-time weather updates, including temperature, humidity, UV index, and rain probability, along with a 3-day weather forecast.

🤖 The app integrates AI-powered predictions to help users decide whether it's a good time to go out based on the expected weather conditions, making daily planning easier and more accurate!

## Table of contents
- ### [Setting Up The Local Server =>](#setting_up_the_local_server)
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
## Screenshots
Here are some screeshots for the application:
![Screenshot (65)](https://github.com/user-attachments/assets/f9cda08c-b476-4a68-9a5b-a6ec7d759586)
![Screenshot (66)](https://github.com/user-attachments/assets/54b0dc3a-8884-49bc-bcbe-9493629a8c8a)
![Screenshot (67)](https://github.com/user-attachments/assets/52d21d88-8eb9-4253-8ca8-fcf0225ff73a)
![Screenshot (68)](https://github.com/user-attachments/assets/a147bd5a-3c9b-450b-b497-f153f74cb1c1)
![Screenshot (69)](https://github.com/user-attachments/assets/46f29452-393d-4d63-9c1d-38f3574f9c6e)
![Screenshot (70)](https://github.com/user-attachments/assets/56a6a58e-b7ac-4ed2-bc4f-d4a283689737)
![Screenshot (71)](https://github.com/user-attachments/assets/9ee72e6f-76ae-4ed0-91bf-1328156f107e)
![Screenshot (72)](https://github.com/user-attachments/assets/42cdb4ab-ad4a-4b97-87e0-88962fbc6029)

## Demo Video
https://github.com/user-attachments/assets/9ddd4164-3d5c-4c98-a830-40814e2d52ba
