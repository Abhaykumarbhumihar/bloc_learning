# bloc_learning

Welcome to the `bloc_learning` project! This is a Flutter application that demonstrates the use of BLoC (Business Logic Component) architecture for state management.

## Getting Started

To get started with this project, follow these steps:

### Prerequisites

Make sure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- An IDE (e.g., [Visual Studio Code](https://code.visualstudio.com/), [Android Studio](https://developer.android.com/studio))

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/bloc_learning.git

2. Navigate to the project directory:
   cd bloc_learning

3. Running the Project
   Run the application using the following command:

   flutter run
   
   Project Structure

  The project is organized into three main layers:

1. Domain Layer
   Entities: Core objects (e.g., User) that represent the business domain.

   Repositories: Abstract interfaces for accessing data, defining the contract for data retrieval.
   
  UseCases: Business rules that act as an intermediary between the UI and the repository.
2. Data Layer
   
   Data Models: Classes that convert raw data (e.g., from Firebase) into domain entities.
  
   Repository Implementation: Concrete implementations of repository interfaces, handling data interactions with external services (e.g., Firebase).

3. Presentation Layer
  
   UI Widgets: Components that define the visual structure of the application.
 
   BLoC/Controller Logic: Manages the state and business logic of the UI, separating concerns from the presentation layer.









