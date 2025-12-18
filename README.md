# Clima Flutter

A real-time weather application built with Flutter that displays weather conditions based on your current location or any city you search for.

## Features

- **GPS Weather** - Automatically fetches weather data for your current location
- **City Search** - Look up weather for any city worldwide
- **Weather Icons** - Visual emoji indicators for weather conditions
- **Smart Recommendations** - Clothing suggestions based on temperature
- **Dark Theme** - Modern dark UI design

## Getting Started

### Prerequisites

- Flutter SDK (>=2.19.4)
- An [OpenWeatherMap](https://openweathermap.org/api) API key (free tier available)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/nihalmorshed/clima_flutter.git
   cd clima_flutter
   ```

2. Add your API key in `lib/utilities/constants.dart`:
   ```dart
   const apiKey = 'YOUR_API_KEY_HERE';
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Usage

1. **On Launch** - The app automatically detects your location and displays local weather
2. **Refresh** - Tap the location icon (top-left) to update weather for your current position
3. **Search** - Tap the city icon (top-right) to search weather by city name

## Dependencies

| Package | Purpose |
|---------|---------|
| `geolocator` | GPS location services |
| `http` | API requests |
| `flutter_spinkit` | Loading animations |

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # UI screens
│   ├── loading_screens.dart  # Splash screen
│   ├── location_screen.dart  # Main weather display
│   └── city_screens.dart     # City search
├── services/                 # Business logic
│   ├── weather.dart          # Weather data handling
│   ├── location.dart         # GPS services
│   └── networking.dart       # HTTP client
└── utilities/
    └── constants.dart        # API config & styles
```

## Configuration

For detailed technical documentation, customization options, and modification guides, see [TECHNICAL.md](TECHNICAL.md).

## License

This project is for educational purposes.
