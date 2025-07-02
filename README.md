![WhatsApp Image 2025-07-03 at 1 16 17 AM (3)-portrait](https://github.com/user-attachments/assets/b55ee216-c084-4e40-bbd8-e609f2c5cb7f)
# ai_weather
🌦 AI Weather App is a smart application that provides real-time weather updates, including temperature, humidity, UV index, and rain probability, along with a 3-day weather forecast.

🤖 The app integrates AI-powered predictions to help users decide whether it's a good time to go out based on the expected weather conditions, making daily planning easier and more accurate!

## Table of contents
- ### [Setting Up The Local Server =>](#setting-up-the-local-server)
- ### [main packages used =>](#main-packages-used)
- ### [Folder structure =>](#folder-structure)
- ### [Screenshots =>](#screenshots)
- ### [Demo video =>](#demo-video)


## Setting Up The Local Server
Follow these steps to set up the local server:
Run These Comands in your Terminal
### 1️⃣ Create a Virtual Environment
#### 🖥️ **Windows**
```sh
python -m venv venv
venv\Scripts\activate.bat
Set-ExecutionPolicy Unrestricted -Scope Process
venv\Scripts\Activate.ps1
```
#### 🖥️ **Mac**
```sh
python3 -m venv venv
source venv/bin/activate
```
### 2️⃣ Install the required packages:
```sh
pip install Flask
pip install numpy
pip install scikit-learn==1.3.2
```
### 3️⃣ Run the server:
```sh
python app.py // to host the AI model and access it through your local host on port 5001.
```
### 4️⃣ Check if the server is running:
```sh
http://127.0.0.1:5001
```
### 5️⃣ Send data to the model using the POST method:
```sh
http://10.0.2.2:5001/predict
```
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

ai_weather
```
├── android
├── assets
├── build
├── docs
├── ios
├── lib
└── test
```
Here is the folder structure we have been using in this project:

📂 docs Folder

The docs folder contains detailed documentation for each feature in the application.
If you want to understand how authentication, weather data fetching, and AI predictions work, check out the following files:
```
├── docs
│   ├── auth_feature.md          # Detailed explanation of the authentication system
│   ├── geo_weather_feature.md   # How the app fetches weather data based on the user's location
│   └── get_prediction.md        # How the AI model predicts and suggests the best time to go out
```

📂 lib Folder
```
├── lib
│   ├── core
│   ├── features
│   │   ├── presentation
│   │   │   ├── auth
│   │   │   └── home
│   └── main.dart
```
### core
This folder contains all services and tools related to the application
```
├── core
│   ├── app_router
│   ├── di
│   ├── error
│   ├── helper
│   ├── location
│   ├── network
│   ├── styles
│   └── utils                
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




## Demo Video
https://github.com/user-attachments/assets/9ddd4164-3d5c-4c98-a830-40814e2d52ba
