# Climate Tracking Application

A comprehensive weather application built with Flutter that provides real-time weather information using device location services and city-based searches. The application combines modern design principles with practical functionality to deliver accurate weather data to users.

## Features and Functionality

The application offers a robust set of features that make weather tracking intuitive and informative:

* Real-time weather data retrieval using the OpenWeatherMap API
* Location-based weather detection using device GPS
* City-based weather search functionality
* Dynamic weather condition icons that adapt to current conditions
* Temperature-based clothing recommendations
* Smooth loading transitions with elegant animations
* Dark theme optimization for better visibility
* Responsive design that works across different screen sizes

## Technical Foundation

The application is built using several key technologies and frameworks:

* Flutter SDK (>=2.19.4 <3.0.0) for cross-platform development
* Dart programming language
* Geolocator (^9.0.2) for precise location services
* HTTP package (^0.13.5) for API communication
* Flutter Spinkit (^5.1.0) for loading animations
* Custom fonts integration (Spartan MB)
* OpenWeatherMap API for weather data

## Project Structure

The application follows a clean, modular architecture:

```
clima_flutter/
├── lib/
│   ├── screens/
│   │   ├── city_screens.dart     # City search interface
│   │   ├── loading_screens.dart  # Initial loading screen
│   │   └── location_screen.dart  # Main weather display
│   ├── services/
│   │   ├── location.dart         # Location handling
│   │   ├── networking.dart       # API communication
│   │   └── weather.dart          # Weather data processing
│   ├── utilities/
│   │   └── constants.dart        # App-wide constants
│   └── main.dart                 # Application entry point
├── images/                       # Asset images
└── fonts/                        # Custom typography
```

## Installation and Setup

Follow these steps to get the application running on your local machine:

1. Ensure Flutter is installed and configured on your system:
```bash
flutter doctor
```

2. Clone the repository:
```bash
git clone https://github.com/nihalmorshed/clima_flutter.git
```

3. Navigate to the project directory:
```bash
cd clima_flutter
```

4. Install dependencies:
```bash
flutter pub get
```

5. Set up your OpenWeatherMap API key:
   * Sign up at OpenWeatherMap to get an API key
   * Replace the `apiKey` constant in `constants.dart` with your key

6. Run the application:
```bash
flutter run
```

## Usage Guide

The application provides an intuitive user experience:

1. Upon launching, the app automatically detects your location and displays local weather
2. The main screen shows:
   * Current temperature
   * Weather condition icon
   * Clothing recommendation based on temperature
   * Current city name
3. Navigation options include:
   * Location refresh button (↻) to update current location weather
   * City search button (🏙) to find weather in other cities

## Understanding the Code Structure

The application implements several key architectural patterns:

* **Service Layer Pattern**: Separates data fetching and processing logic
* **Screen Management**: Utilizes Flutter's navigation system for smooth transitions
* **Asynchronous Operations**: Implements Future and async/await for smooth data fetching
* **State Management**: Uses StatefulWidget for dynamic UI updates

## Custom Styling

The application includes thoughtful design elements:

* Custom Spartan MB font for consistent typography
* Dark theme optimization for better readability
* Weather-appropriate icons for different conditions
* Smooth loading animations
* Background images that adapt to different screens

## Contributing

We welcome contributions to improve the application. To contribute:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to your branch
5. Create a Pull Request

## Requirements

* Flutter SDK (>=2.19.4 <3.0.0)
* iOS 9.0 or higher / Android 4.4 or higher
* Active internet connection
* Device location services enabled
* OpenWeatherMap API key

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

* Weather data provided by OpenWeatherMap API
* Built with Flutter framework
* Icons and weather conditions mapping inspired by standard meteorological symbols
