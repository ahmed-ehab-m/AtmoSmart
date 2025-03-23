
# ai_weather
##preview
https://github.com/user-attachments/assets/9ddd4164-3d5c-4c98-a830-40814e2d52ba


1-Run these commands in the terminal

##windows
python -m venv venv
venv\Scripts\activate.bat
Set-ExecutionPolicy Unrestricted -Scope Process
venv\Scripts\Activate.ps1

##Mac
python3 -m venv venv
source venv/bin/activate

pip install Flask

pip show Flask

pip install numpy

pip install scikit-learn==1.3.2

python app.py

python app.py // to host the AI model and access it through your local host on port 5001.

2- check if your file sucess host success or not by try this IP ('http://127.0.0.1:5001') in your browser.

3- Send your list to the model using POST method use this IP : ('http://10.0.2.2:5001/predict') in your flutter app.

#App preview

# GetPrediction Demo
https://github.com/user-attachments/assets/3aa79804-f9d4-40ed-bec2-0ec52deddde7
# GeoWeather feature Demo


https://github.com/user-attachments/assets/d7d8460a-6578-47ac-86b3-64ff265f975c


# AuthFeature Demo
https://github.com/user-attachments/assets/411a344c-b09c-4c5a-b057-73c268ecd726
## Project Structure
## This project follows CleanArch (Feature Based) and MVVM (Model-View-ViewModel) architecture.

# lib
## Features: Contains App Features
## core: Contains Common Code and HelperClass .

## Feature Structure includeing:
###  1-Data Layer :
### Responsible for data management, including:
### Repositories: Interfaces for data access.






### Data Sources: implementations for fectching and store data



### Models: Data models for serialization and deserialization.

### 2-Domain Layer
## Encapsulates business logic, including:
## Use Cases: application-specific business logic like Authentication.
## Entities:  objects that define the essential business rules, 

### 3-Presentation Layer
### Handles UI and state management, including:
## View Models: State Management to handle User Actions.
## Views: Flutter widgets for rendering the user interface.

# Features
## 1-Authentication: User login and registration.
### for more Details Check /docs/auth_feaure.md

## 2-get Weather: handels getting current and forecast weather.
### for more Details Check /docs/geo_weather_feaure.md





