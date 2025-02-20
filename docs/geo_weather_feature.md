# GeoWeatherFeature Feature Documentation
## overview/
    this feature manages getting current and forecast weather based on Location

## Architecture (CLEAN ARCH and Follows MVVM Pattern)/
## core
### network
 `/api_service.dart`
    ApiService class using DIO package to make a request to API Weather for 
    getting weather data
## Lib
###  /Data Layer 
### Manages Authentication Data
 `RemoteDataSource` → Handles getting weather data from Weather API.
 `RemoteRepositoryImpl` → Implements `WeatherRepository`.

###  /Domain Layer
### Contains BusinessLogic 
 `WeatherRepository` => Abstracrt Repositry Interface
 `GetWeatherCase` → Handles getting weather data from Weather API.

### /Presentation Layer**
### Handels UI , STateManagement
- `WeatherCubit` → Manages getting Weather state.