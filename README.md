# ai_weather
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
## Authentication: User login and registration.
### for more Details Check lib/docs/auth_feaure.md




