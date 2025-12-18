# Clima Flutter - Weather Application

## Complete Technical Documentation

A real-time weather application built with Flutter that fetches weather data based on device GPS location or user-specified city name using the OpenWeatherMap API.

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Technology Stack](#technology-stack)
4. [Project Architecture](#project-architecture)
5. [Directory Structure](#directory-structure)
6. [Complete File Documentation](#complete-file-documentation)
7. [Screen-by-Screen Breakdown](#screen-by-screen-breakdown)
8. [Service Layer Documentation](#service-layer-documentation)
9. [UI Components & Styling](#ui-components--styling)
10. [Animations & Visual Effects](#animations--visual-effects)
11. [API Integration](#api-integration)
12. [Platform Configurations](#platform-configurations)
13. [Dependencies](#dependencies)
14. [Modification Guide](#modification-guide)
15. [Troubleshooting](#troubleshooting)

---

## Project Overview

**App Name:** Clima
**Package Name:** `com.example.clima_flutter`
**Version:** 1.0.0+1
**Dart SDK:** >=2.19.4 <3.0.0
**Theme:** Dark Theme (Material Design)

### What This App Does

1. On launch, displays a loading animation while fetching device GPS coordinates
2. Retrieves current weather data from OpenWeatherMap API
3. Displays temperature (Celsius), weather condition emoji, and clothing recommendation
4. Allows manual city search for weather in different locations
5. Provides refresh functionality to update current location weather

---

## Features

| Feature | Description | Location in Code |
|---------|-------------|------------------|
| GPS Location Weather | Fetches weather based on device location | `lib/services/location.dart` |
| City Search | Search weather by city name | `lib/screens/city_screens.dart` |
| Weather Icons | Emoji-based weather condition display | `lib/services/weather.dart:23-41` |
| Temperature Messages | Clothing recommendations based on temp | `lib/services/weather.dart:43-53` |
| Loading Animation | SpinKit double bounce animation | `lib/screens/loading_screens.dart:37-40` |
| Background Images | Full-screen background overlays | `images/` folder |
| Custom Typography | Spartan font family | `fonts/SpartanMB-Black.otf` |

---

## Technology Stack

| Component | Technology | Version |
|-----------|------------|---------|
| Framework | Flutter | SDK |
| Language | Dart | >=2.19.4 |
| HTTP Client | http package | ^0.13.5 |
| Geolocation | geolocator package | ^9.0.2 |
| Animations | flutter_spinkit | ^5.1.0 |
| Icons | cupertino_icons | ^1.0.2 |
| Weather API | OpenWeatherMap | v2.5 |

---

## Project Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         PRESENTATION LAYER                       │
│  ┌─────────────┐  ┌─────────────────┐  ┌─────────────────────┐  │
│  │LoadingScreen│──│ LocationScreen  │──│    CityScreen       │  │
│  │  (Splash)   │  │ (Main Weather)  │  │ (City Search)       │  │
│  └─────────────┘  └─────────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                         SERVICE LAYER                            │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │  WeatherModel   │  │ LocationService │  │  NetworkHelper  │  │
│  │ (Business Logic)│  │  (GPS Handler)  │  │ (HTTP Client)   │  │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                         UTILITIES LAYER                          │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                     constants.dart                          ││
│  │        (API Config, TextStyles, InputDecorations)           ││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                       EXTERNAL SERVICES                          │
│  ┌─────────────────────────┐  ┌─────────────────────────────┐   │
│  │   OpenWeatherMap API    │  │    Device GPS (Geolocator)  │   │
│  └─────────────────────────┘  └─────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

---

## Directory Structure

```
clima_flutter/
│
├── lib/                              # Main Dart source code
│   ├── main.dart                     # Application entry point
│   ├── scratch.dart                  # Async/await practice file (not used in app)
│   │
│   ├── screens/                      # UI Screens
│   │   ├── loading_screens.dart      # Splash/loading screen with animation
│   │   ├── location_screen.dart      # Main weather display screen
│   │   └── city_screens.dart         # City search input screen
│   │
│   ├── services/                     # Business logic & external services
│   │   ├── weather.dart              # Weather data model & API logic
│   │   ├── location.dart             # GPS location service
│   │   └── networking.dart           # HTTP request handler
│   │
│   └── utilities/                    # Constants & configurations
│       └── constants.dart            # API keys, styles, decorations
│
├── images/                           # Image assets
│   ├── location_background.jpg       # Main screen background
│   └── city_background.jpg           # City search screen background
│
├── fonts/                            # Custom fonts
│   └── SpartanMB-Black.otf           # Spartan font family
│
├── android/                          # Android platform code
│   ├── app/
│   │   └── src/main/
│   │       └── AndroidManifest.xml   # Permissions & app config
│   └── ...
│
├── ios/                              # iOS platform code
│   └── Runner/
│       └── Info.plist                # iOS app configuration
│
├── web/                              # Web platform code
├── windows/                          # Windows platform code
├── macos/                            # macOS platform code
├── linux/                            # Linux platform code
├── test/                             # Test files
│
├── pubspec.yaml                      # Dependencies & assets config
├── analysis_options.yaml             # Linting rules
└── README.md                         # This documentation
```

---

## Complete File Documentation

### 1. `lib/main.dart` - Application Entry Point

**Purpose:** Initializes the Flutter application and sets the initial route.

```dart
// Line-by-line breakdown:

Line 1:  import 'package:clima_flutter/screens/loading_screens.dart';
         // Imports the LoadingScreen widget for initial display

Line 2:  import 'package:flutter/material.dart';
         // Imports Flutter Material Design components

Line 4-6: void main() { runApp(const MyApp()); }
          // Standard Flutter entry point - runs MyApp widget

Line 8-18: class MyApp extends StatelessWidget
           // Root widget configuration
```

**Key Configuration:**

| Property | Value | To Modify |
|----------|-------|-----------|
| Initial Screen | `LoadingScreen()` | Change `home:` parameter on line 14 |
| Theme | `ThemeData.dark()` | Change to `ThemeData.light()` or custom theme on line 15 |
| App Type | Material App | Change `MaterialApp` to `CupertinoApp` for iOS style |

**How to Modify:**
- **Change theme:** Replace `ThemeData.dark()` with:
  - `ThemeData.light()` for light theme
  - `ThemeData(primarySwatch: Colors.blue)` for custom theme
- **Change initial screen:** Replace `LoadingScreen()` with any other screen widget

---

### 2. `lib/screens/loading_screens.dart` - Splash Screen

**Purpose:** Displays loading animation while fetching initial weather data.

**Widget Type:** StatefulWidget (requires state management for async operations)

**Complete Structure:**

```
LoadingScreen (StatefulWidget)
    └── _LoadingScreenState (State)
            ├── getLocation() - async method to fetch weather
            ├── initState() - lifecycle method, triggers getLocation()
            └── build() - returns UI with Scaffold
                    └── Scaffold
                        └── body: Center
                                └── SpinKitDoubleBounce (animation)
```

**Animation Details:**

| Property | Value | File Location | To Modify |
|----------|-------|---------------|-----------|
| Animation Type | `SpinKitDoubleBounce` | Line 37 | Change to other SpinKit animations |
| Color | `Colors.white` | Line 38 | Change to any `Colors.xxx` |
| Size | `100.0` pixels | Line 39 | Increase/decrease value |

**Available SpinKit Alternatives:**
- `SpinKitRotatingCircle` - Rotating circle
- `SpinKitDoubleBounce` - Two bouncing circles (current)
- `SpinKitWave` - Wave bars
- `SpinKitWanderingCubes` - Moving cubes
- `SpinKitFadingCircle` - Fading dots in circle
- `SpinKitPulse` - Pulsing circle
- `SpinKitChasingDots` - Chasing dots
- `SpinKitThreeBounce` - Three bouncing dots
- `SpinKitCircle` - Spinning circle dots
- `SpinKitCubeGrid` - 3x3 cube grid
- `SpinKitFadingFour` - Four fading squares
- `SpinKitRing` - Ring spinner
- `SpinKitRipple` - Ripple effect
- `SpinKitSpinningCircle` - Spinning filled circle

**Flow Logic:**

```
1. LoadingScreen created
        │
        ▼
2. initState() called automatically
        │
        ▼
3. getLocation() invoked
        │
        ▼
4. WeatherModel.getLocationWeather() called
        │
        ▼
5. Weather data received
        │
        ▼
6. Navigator.push() → LocationScreen
```

**Known Issue:** `getLocation()` is called twice - once in `initState()` (line 29) and once in `build()` (line 34). The call in `build()` should be removed for optimization.

**How to Modify Animation:**
```dart
// Change from:
SpinKitDoubleBounce(
  color: Colors.white,
  size: 100.0,
)

// To (example with wave animation):
SpinKitWave(
  color: Colors.blue,
  size: 50.0,
  itemCount: 5,  // number of bars
)
```

---

### 3. `lib/screens/location_screen.dart` - Main Weather Display

**Purpose:** Displays weather information and provides navigation options.

**Widget Type:** StatefulWidget

**Constructor Parameter:**
- `locationWeather` (dynamic) - Weather data JSON from API

**State Variables:**

| Variable | Type | Purpose | Line |
|----------|------|---------|------|
| `weatherModel` | `WeatherModel` | Instance for API calls | 23 |
| `temperature` | `int` | Current temperature in Celsius | 24 |
| `weatherIcon` | `String` | Emoji for weather condition | 25 |
| `weatherMessage` | `String` | Clothing recommendation | 26 |
| `cityName` | `String` | Name of current city | 27 |

**Widget Tree:**

```
LocationScreen (StatefulWidget)
└── Scaffold
    └── body: Container
        ├── decoration: BoxDecoration
        │   └── image: DecorationImage
        │       ├── image: AssetImage('images/location_background.jpg')
        │       ├── fit: BoxFit.cover
        │       └── colorFilter: ColorFilter.mode
        │           ├── color: Colors.white.withOpacity(0.8)
        │           └── blendMode: BlendMode.dstATop
        │
        └── child: SafeArea
            └── Column (mainAxisAlignment: spaceBetween)
                │
                ├── [TOP] Row (spaceBetween)
                │   ├── TextButton (Refresh/Location)
                │   │   └── Icon: Icons.near_me (50px, white)
                │   │
                │   └── TextButton (City Search)
                │       └── Icon: Icons.location_city (50px, white)
                │
                ├── [MIDDLE] Padding (8px)
                │   └── Row
                │       ├── Text: "$temperature°" (ktempTextStyle)
                │       └── Text: weatherIcon (kConditionTextStyle)
                │
                └── [BOTTOM] Padding (8px)
                    └── Text: "$weatherMessage in $cityName!"
                        └── style: kMessageTextStyle
                        └── textAlign: TextAlign.right
```

**Background Image Configuration:**

| Property | Value | Purpose |
|----------|-------|---------|
| `fit` | `BoxFit.cover` | Scales image to cover entire container |
| `colorFilter` | White @ 80% opacity | Creates semi-transparent overlay |
| `blendMode` | `BlendMode.dstATop` | Blends overlay with image |

**To change background opacity:** Modify line 61
```dart
Colors.white.withOpacity(0.8)  // 0.0 = invisible, 1.0 = solid white
```

**Button Functions:**

| Button | Icon | Action | Lines |
|--------|------|--------|-------|
| Refresh | `Icons.near_me` | Fetches weather for current GPS location | 75-85 |
| City | `Icons.location_city` | Navigates to CityScreen, fetches city weather | 86-105 |

**updateUI() Method (Lines 34-50):**

```dart
void updateUI(dynamic weatherData) {
  setState(() {
    if (weatherData == null) {
      // Error handling
      temperature = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
      return;
    }
    // Parse JSON data
    double temp = weatherData['main']['temp'];      // API returns double
    temperature = temp.toInt();                      // Convert to int for display
    int condition = weatherData['weather'][0]['id']; // Weather condition code
    weatherIcon = weatherModel.getWeatherIcon(condition);
    weatherMessage = weatherModel.getMessage(temperature);
    cityName = weatherData['name'];
  });
}
```

**API JSON Structure Expected:**
```json
{
  "main": {
    "temp": 25.5
  },
  "weather": [
    {
      "id": 800,
      "description": "clear sky"
    }
  ],
  "name": "London"
}
```

**How to Modify Layout:**
- **Change button icons:** Modify `Icons.near_me` and `Icons.location_city` to any Material Icon
- **Change icon size:** Modify `size: 50.0` on lines 82 and 103
- **Change temperature position:** Rearrange children in Column
- **Add more weather info:** Add more Text widgets in the Column

---

### 4. `lib/screens/city_screens.dart` - City Search Screen

**Purpose:** Allows user to enter a city name for weather lookup.

**Widget Type:** StatefulWidget

**Global Variable:**
- `cityName` (String) - Stores the entered city name (line 4)

**Widget Tree:**

```
CityScreen (StatefulWidget)
└── Scaffold
    └── body: Container
        ├── decoration: BoxDecoration
        │   └── image: DecorationImage
        │       ├── image: AssetImage('images/city_background.jpg')
        │       └── fit: BoxFit.cover
        │
        └── child: SafeArea
            └── Column
                │
                ├── Align (topLeft)
                │   └── TextButton (Back)
                │       └── Icon: Icons.arrow_back_ios (50px, white)
                │
                ├── Container (padding: 20px)
                │   └── TextField
                │       ├── onChanged: updates cityName
                │       ├── style: TextStyle(color: Colors.green.shade900)
                │       └── decoration: kCityNameInputDecoration
                │
                └── TextButton
                    └── Text: 'Get Weather' (kButtonTextStyle)
```

**TextField Configuration:**

| Property | Value | Purpose |
|----------|-------|---------|
| `onChanged` | `cityName = value` | Updates global variable on each keystroke |
| `style.color` | `Colors.green.shade900` | Text color while typing |
| `decoration` | `kCityNameInputDecoration` | Predefined input styling |

**Navigation Flow:**
```
1. User types city name → stored in `cityName` variable
2. User taps "Get Weather"
3. Navigator.pop(context, cityName) → returns to LocationScreen
4. LocationScreen receives city name → fetches weather
5. Weather displayed for searched city
```

**How to Modify:**
- **Change text input color:** Line 46 - `Colors.green.shade900`
- **Change back button icon:** Line 33 - `Icons.arrow_back_ios`
- **Change button text:** Line 56 - `'Get Weather'`

---

### 5. `lib/services/weather.dart` - Weather Business Logic

**Purpose:** Handles weather data fetching and processing.

**Class:** `WeatherModel`

**Methods:**

#### `getCityWeather(String cityName)` - Lines 6-11
```dart
Future getCityWeather(String cityName) async {
  NetworkHelper networkHelper = NetworkHelper(
    url: '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric'
  );
  var weatherData = await networkHelper.getData();
  return weatherData;
}
```
**API URL Structure:** `https://api.openweathermap.org/data/2.5/weather?q={city}&appid={key}&units=metric`

#### `getLocationWeather()` - Lines 13-21
```dart
Future getLocationWeather() async {
  LocationService location = LocationService();
  await location.getCurrentLocation();
  NetworkHelper networkHelper = NetworkHelper(
    url: '$openWeatherMapURL?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric'
  );
  var weatherData = await networkHelper.getData();
  return weatherData;
}
```
**API URL Structure:** `https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={key}&units=metric`

#### `getWeatherIcon(int condition)` - Lines 23-41

**Weather Condition Code Mapping (OpenWeatherMap Standard):**

| Condition Code Range | Weather Type | Emoji | Line |
|---------------------|--------------|-------|------|
| < 300 | Thunderstorm | 🌩 | 24-25 |
| 300-399 | Drizzle | 🌧 | 26-27 |
| 400-599 | Rain | ☔️ | 28-29 |
| 600-699 | Snow | ☃️ | 30-31 |
| 700-799 | Atmosphere (Mist/Fog/Haze) | 🌫 | 32-33 |
| 800 | Clear Sky | ☀️ | 34-35 |
| 801-804 | Clouds | ☁️ | 36-37 |
| > 804 | Unknown | 🤷‍ | 38-39 |

**OpenWeatherMap Condition Codes Reference:**
- **2xx:** Thunderstorm (200-232)
- **3xx:** Drizzle (300-321)
- **5xx:** Rain (500-531)
- **6xx:** Snow (600-622)
- **7xx:** Atmosphere (701-781) - mist, smoke, haze, dust, fog, sand, ash, squall, tornado
- **800:** Clear
- **80x:** Clouds (801-804)

#### `getMessage(int temp)` - Lines 43-53

**Temperature-based Clothing Recommendations:**

| Temperature Range | Message | Emoji |
|-------------------|---------|-------|
| > 25°C | "It's 🍦 time" | Ice cream |
| 21-25°C | "Time for shorts and 👕" | T-shirt |
| < 10°C | "You'll need 🧣 and 🧤" | Scarf & Gloves |
| 10-20°C | "Bring a 🧥 just in case" | Jacket |

**How to Modify Weather Icons:**
```dart
// Example: Add tornado icon for specific condition
if (condition >= 781 && condition < 800) {
  return '🌪️';  // Tornado
}
```

**How to Add New Temperature Messages:**
```dart
// Example: Add extreme heat message
if (temp > 35) {
  return 'Stay hydrated! 💧🥵';
}
```

---

### 6. `lib/services/location.dart` - GPS Location Service

**Purpose:** Retrieves device GPS coordinates.

**Class:** `LocationService`

**Properties:**

| Property | Type | Initial Value | Purpose |
|----------|------|---------------|---------|
| `lat` | `double` | `0.0` | Latitude coordinate |
| `long` | `double` | `0.0` | Longitude coordinate |
| `alt` | `double` | `0.0` | Altitude (not currently used) |

**Method: `getCurrentLocation()`** - Lines 8-24

**Flow:**
```
1. Check if location services enabled
        │
        ▼
2. Check location permissions
        │
        ▼
3. Request permissions if needed
        │
        ▼
4. Get current position (low accuracy for faster response)
        │
        ▼
5. Store lat, long, alt in properties
```

**Location Accuracy Options:**
- `LocationAccuracy.lowest` - ~3000m accuracy
- `LocationAccuracy.low` - ~1000m accuracy (CURRENT)
- `LocationAccuracy.medium` - ~100m accuracy
- `LocationAccuracy.high` - ~10m accuracy
- `LocationAccuracy.best` - Best available
- `LocationAccuracy.bestForNavigation` - Best with altitude

**How to Modify Accuracy:**
```dart
// Line 16-17: Change desiredAccuracy
Position position = await Geolocator.getCurrentPosition(
  desiredAccuracy: LocationAccuracy.high  // More accurate but slower
);
```

---

### 7. `lib/services/networking.dart` - HTTP Client

**Purpose:** Handles HTTP requests to external APIs.

**Class:** `NetworkHelper`

**Constructor Parameter:**
- `url` (String?) - The API endpoint URL

**Method: `getData()`** - Lines 8-18

```dart
Future getData() async {
  Response response = await get(Uri.parse(url!));

  if (response.statusCode == 200) {
    String data = response.body;
    var decodedData = jsonDecode(data);
    return decodedData;
  } else {
    print(response.statusCode);
  }
}
```

**Response Handling:**

| Status Code | Action |
|-------------|--------|
| 200 | Parse JSON and return data |
| Other | Print status code, return null |

**Common HTTP Status Codes:**
- 200: Success
- 400: Bad Request (invalid city name)
- 401: Unauthorized (invalid API key)
- 404: Not Found
- 429: Too Many Requests (rate limit)
- 500: Server Error

**How to Add Error Handling:**
```dart
Future getData() async {
  try {
    Response response = await get(Uri.parse(url!));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Invalid API key');
    } else if (response.statusCode == 404) {
      throw Exception('City not found');
    }
  } catch (e) {
    print('Network error: $e');
    return null;
  }
}
```

---

### 8. `lib/utilities/constants.dart` - Configuration & Styling

**Purpose:** Centralized storage for API configuration and UI styling constants.

**API Configuration:**

| Constant | Value | Line | Purpose |
|----------|-------|------|---------|
| `apiKey` | `'e364cb71360b7c32508f3c6abdcdbb00'` | 3 | OpenWeatherMap API key |
| `openWeatherMapURL` | `'https://api.openweathermap.org/data/2.5/weather'` | 4 | Base API endpoint |

**⚠️ IMPORTANT:** Replace `apiKey` with your own OpenWeatherMap API key.
Get one free at: https://openweathermap.org/api

**Text Styles:**

#### `ktempTextStyle` - Temperature Display (Lines 5-8)
```dart
const ktempTextStyle = TextStyle(
  fontFamily: 'Spartan',
  fontSize: 100.0,
);
```
| Property | Value | To Modify |
|----------|-------|-----------|
| Font | Spartan | Change `fontFamily` or add `fontWeight` |
| Size | 100px | Increase/decrease `fontSize` |
| Color | Inherited (white from dark theme) | Add `color: Colors.xxx` |

#### `kMessageTextStyle` - Weather Message (Lines 29-32)
```dart
const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan',
  fontSize: 60.0,
);
```

#### `kButtonTextStyle` - Button Text (Lines 34-38)
```dart
const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan',
  color: Colors.white,
);
```

#### `kConditionTextStyle` - Weather Emoji (Lines 40-42)
```dart
const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
```

**Input Decoration:**

#### `kCityNameInputDecoration` - City TextField (Lines 10-27)
```dart
const kCityNameInputDecoration = InputDecoration(
  filled: true,                          // Enable background fill
  fillColor: Colors.white,               // White background
  icon: Icon(
    Icons.location_city,                 // Icon outside field
    color: Colors.white,
  ),
  hintText: 'Enter City Name',           // Placeholder text
  hintStyle: TextStyle(
    color: Colors.grey,                  // Grey placeholder
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),             // Rounded corners
    ),
    borderSide: BorderSide.none,         // No visible border
  ),
);
```

**How to Modify Input Field Appearance:**
```dart
// Example: Blue themed input with different icon
const kCityNameInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.lightBlue[50],
  icon: Icon(
    Icons.search,
    color: Colors.blue,
  ),
  hintText: 'Search for a city...',
  hintStyle: TextStyle(color: Colors.blue[300]),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: Colors.blue, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: Colors.blue, width: 2),
  ),
);
```

---

### 9. `lib/scratch.dart` - Practice File (Not Used in App)

**Purpose:** Educational file demonstrating async/await patterns in Dart.

**Contents:**
- `task1()` - Synchronous sleep example (6 seconds)
- `task2()` - Async Future example (3 seconds)
- `task3(String message)` - Takes parameter from task2
- `performTasks()` - Demonstrates sequential async execution

**Note:** This file is NOT imported anywhere in the app. It's kept for learning reference.

---

## Screen-by-Screen Breakdown

### Screen Flow Diagram

```
┌─────────────────┐
│   App Launch    │
│   (main.dart)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Loading Screen  │◄──────────────────────────────────┐
│ - SpinKit anim  │                                   │
│ - Fetch GPS     │                                   │
│ - Fetch weather │                                   │
└────────┬────────┘                                   │
         │                                            │
         │ Navigator.push()                           │
         ▼                                            │
┌─────────────────┐      Navigator.push()      ┌──────┴────────┐
│Location Screen  │ ──────────────────────────►│  City Screen  │
│ - Temperature   │                            │ - Text Input  │
│ - Weather Icon  │◄──────────────────────────│ - Get Weather │
│ - Message       │    Navigator.pop(cityName) └───────────────┘
│ - Refresh btn   │
│ - City btn      │
└─────────────────┘
         │
         │ Refresh button
         │ (stays on same screen,
         │  updates state)
         ▼
    [Weather Updated]
```

---

## Service Layer Documentation

### Data Flow Sequence

```
┌──────────────┐    1. Request     ┌──────────────┐
│   UI Layer   │ ─────────────────►│ WeatherModel │
│  (Screens)   │                   │              │
└──────────────┘                   └──────┬───────┘
       ▲                                  │
       │                      2a. Get GPS │ 2b. Build URL
       │                          ┌───────┴───────┐
       │                          ▼               ▼
       │                   ┌─────────────┐ ┌─────────────┐
       │                   │LocationServ.│ │NetworkHelper│
       │                   │(Geolocator) │ │  (HTTP)     │
       │                   └──────┬──────┘ └──────┬──────┘
       │                          │               │
       │                   3. Coords        4. HTTP GET
       │                          │               │
       │                          ▼               ▼
       │                   ┌──────────────────────────┐
       │                   │   OpenWeatherMap API     │
       │                   └──────────────────────────┘
       │                                  │
       │                           5. JSON Response
       │                                  │
       │    6. Parsed Data                ▼
       └──────────────────────────[WeatherModel parses]
```

---

## UI Components & Styling

### Color Scheme

| Element | Color | Hex/Value |
|---------|-------|-----------|
| App Theme | Dark | `ThemeData.dark()` |
| Background Overlay | White 80% | `Colors.white.withOpacity(0.8)` |
| Icon Color | White | `Colors.white` |
| Input Background | White | `Colors.white` |
| Input Text | Dark Green | `Colors.green.shade900` |
| Hint Text | Grey | `Colors.grey` |
| Button Text | White | `Colors.white` |

### Typography

| Style Name | Font | Size | Usage |
|------------|------|------|-------|
| `ktempTextStyle` | Spartan | 100px | Temperature display |
| `kMessageTextStyle` | Spartan | 60px | Weather message |
| `kButtonTextStyle` | Spartan | 30px | Button labels |
| `kConditionTextStyle` | System | 100px | Weather emoji |

### Icon Sizes

| Icon | Size | Location |
|------|------|----------|
| Near Me (refresh) | 50px | LocationScreen top-left |
| Location City (search) | 50px | LocationScreen top-right |
| Back Arrow | 50px | CityScreen top-left |
| Location City (input) | Default | CityScreen input field |

---

## Animations & Visual Effects

### 1. SpinKit Double Bounce Animation

**Location:** `lib/screens/loading_screens.dart:37-40`

**Technical Details:**
- Two overlapping circles
- Alternating scale animation
- Infinite loop until navigation
- Pure white color on dark background

**Animation Properties:**
```dart
SpinKitDoubleBounce(
  color: Colors.white,  // Circle color
  size: 100.0,          // Diameter in pixels
)
```

### 2. Background Image Overlay Effect

**Location:** `lib/screens/location_screen.dart:56-65`

**Technical Details:**
- Full-screen background image (`BoxFit.cover`)
- Semi-transparent white overlay
- `BlendMode.dstATop` creates "through fog" effect

**How BlendMode.dstATop Works:**
```
Final = Background Image × (1 - Overlay Alpha) + Overlay × Overlay Alpha
```

With 80% opacity white:
- 80% of the image shows through
- Creates a "faded" or "misty" appearance

### 3. Navigation Transitions

**Type:** Default Material Design push/pop transitions
- Push: Slide in from right
- Pop: Slide out to right

---

## API Integration

### OpenWeatherMap API

**Base URL:** `https://api.openweathermap.org/data/2.5/weather`

**Endpoints Used:**

#### 1. Weather by City Name
```
GET /data/2.5/weather?q={city}&appid={key}&units=metric
```

**Parameters:**
| Parameter | Value | Description |
|-----------|-------|-------------|
| `q` | City name | e.g., "London" |
| `appid` | API key | Your API key |
| `units` | `metric` | Returns Celsius |

#### 2. Weather by Coordinates
```
GET /data/2.5/weather?lat={lat}&lon={lon}&appid={key}&units=metric
```

**Parameters:**
| Parameter | Value | Description |
|-----------|-------|-------------|
| `lat` | Latitude | e.g., 51.5074 |
| `lon` | Longitude | e.g., -0.1278 |
| `appid` | API key | Your API key |
| `units` | `metric` | Returns Celsius |

### API Response Structure

```json
{
  "coord": {
    "lon": -0.1278,
    "lat": 51.5074
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 22.5,
    "feels_like": 21.8,
    "temp_min": 20.0,
    "temp_max": 25.0,
    "pressure": 1013,
    "humidity": 65
  },
  "name": "London",
  "cod": 200
}
```

**Fields Used by This App:**
| Field | Path | Purpose |
|-------|------|---------|
| Temperature | `main.temp` | Display current temp |
| Condition ID | `weather[0].id` | Determine weather icon |
| City Name | `name` | Display city name |

**Unused Fields (Available for Extension):**
- `weather[0].description` - Text description
- `main.feels_like` - Feels like temperature
- `main.humidity` - Humidity percentage
- `main.pressure` - Atmospheric pressure
- `coord.lat/lon` - Coordinates

---

## Platform Configurations

### Android Configuration

**File:** `android/app/src/main/AndroidManifest.xml`

**Permissions Required:**

| Permission | Purpose |
|------------|---------|
| `ACCESS_FINE_LOCATION` | Precise GPS location |
| `ACCESS_COARSE_LOCATION` | Approximate location |
| `ACCESS_BACKGROUND_LOCATION` | Location when app is in background |
| `INTERNET` | API network requests |

**App Label:** "Clima" (shown on home screen)

**Package Name:** `com.example.clima_flutter`

**To Change App Name (Android):**
```xml
<!-- Line 9 -->
<application android:label="Your App Name" ...>
```

### iOS Configuration

**File:** `ios/Runner/Info.plist`

**Display Name:** "Clima Flutter"

**Supported Orientations:**
- iPhone: Portrait, Landscape Left, Landscape Right
- iPad: All four orientations

**To Add Location Permission Message (Required for iOS):**
Add to `Info.plist`:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs your location to show weather for your area.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs your location to show weather for your area.</string>
```

---

## Dependencies

### Production Dependencies

| Package | Version | Purpose | Documentation |
|---------|---------|---------|---------------|
| `flutter` | SDK | Core framework | flutter.dev |
| `cupertino_icons` | ^1.0.2 | iOS-style icons | pub.dev/packages/cupertino_icons |
| `geolocator` | ^9.0.2 | GPS location services | pub.dev/packages/geolocator |
| `http` | ^0.13.5 | HTTP network requests | pub.dev/packages/http |
| `flutter_spinkit` | ^5.1.0 | Loading animations | pub.dev/packages/flutter_spinkit |

### Development Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_test` | SDK | Widget testing |
| `flutter_lints` | ^2.0.0 | Code quality rules |

### Updating Dependencies

```bash
# Check for outdated packages
flutter pub outdated

# Update to latest compatible versions
flutter pub upgrade

# Update to latest major versions (may have breaking changes)
flutter pub upgrade --major-versions
```

---

## Modification Guide

### Common Modifications

#### 1. Change API Key
**File:** `lib/utilities/constants.dart`
**Line:** 3
```dart
const apiKey = 'YOUR_NEW_API_KEY_HERE';
```

#### 2. Change App Theme
**File:** `lib/main.dart`
**Line:** 15
```dart
// Light theme
theme: ThemeData.light(),

// Custom theme
theme: ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
),
```

#### 3. Change Loading Animation
**File:** `lib/screens/loading_screens.dart`
**Lines:** 37-40
```dart
// Replace with any SpinKit widget
SpinKitWave(
  color: Colors.blue,
  size: 50.0,
  itemCount: 5,
)
```

#### 4. Change Background Images
**Folder:** `images/`
- Replace `location_background.jpg` for main screen
- Replace `city_background.jpg` for search screen
- Keep same filenames or update references in code

#### 5. Add More Weather Information
**File:** `lib/screens/location_screen.dart`

Add in Column children (after line 121):
```dart
Text(
  'Humidity: ${weatherData['main']['humidity']}%',
  style: TextStyle(fontSize: 24, color: Colors.white),
),
```

#### 6. Change Temperature Units
**File:** `lib/services/weather.dart`

Change `units=metric` to `units=imperial` for Fahrenheit:
```dart
url: '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=imperial'
```

#### 7. Add New Weather Icon
**File:** `lib/services/weather.dart`
**Method:** `getWeatherIcon()`

```dart
// Add before the else clause
} else if (condition == 781) {
  return '🌪️';  // Tornado
}
```

#### 8. Change Font
**Step 1:** Add font file to `fonts/` folder
**Step 2:** Register in `pubspec.yaml`:
```yaml
fonts:
  - family: YourFontName
    fonts:
      - asset: fonts/YourFont.ttf
```
**Step 3:** Update constants:
```dart
const ktempTextStyle = TextStyle(
  fontFamily: 'YourFontName',
  fontSize: 100.0,
);
```

#### 9. Change Button Icons
**File:** `lib/screens/location_screen.dart`

**Refresh button (line 81):**
```dart
Icons.refresh  // or Icons.my_location, Icons.gps_fixed
```

**City button (line 101):**
```dart
Icons.search  // or Icons.location_searching
```

#### 10. Add Error Messages
**File:** `lib/screens/location_screen.dart`
**Method:** `updateUI()`

```dart
void updateUI(dynamic weatherData) {
  setState(() {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = '❌';
      weatherMessage = 'Check your internet connection';
      cityName = '';
      return;
    }
    // ... rest of code
  });
}
```

---

## Troubleshooting

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| "Unable to get weather data" | API error or no internet | Check internet, verify API key |
| App crashes on launch | Location permission denied | Grant location permission in settings |
| Weather not updating | Cached location | Close app completely, reopen |
| City search returns nothing | Invalid city name | Check spelling, use English name |
| Blank screen after loading | Navigation error | Check console for errors |

### Debug Checklist

1. **API Key Valid?**
   - Test URL in browser: `https://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_KEY`

2. **Location Permission Granted?**
   - Check device settings → App permissions → Location

3. **Internet Connected?**
   - Check INTERNET permission in AndroidManifest.xml

4. **Console Errors?**
   - Run with `flutter run` and check terminal output

### Error Codes from API

| Code | Meaning | Solution |
|------|---------|----------|
| 401 | Invalid API key | Get new key from openweathermap.org |
| 404 | City not found | Check city name spelling |
| 429 | Rate limit exceeded | Wait or upgrade API plan |

---

## File Quick Reference

| What to Change | File | Line(s) |
|----------------|------|---------|
| API Key | `lib/utilities/constants.dart` | 3 |
| Loading Animation | `lib/screens/loading_screens.dart` | 37-40 |
| Background Opacity | `lib/screens/location_screen.dart` | 61 |
| Temperature Font Size | `lib/utilities/constants.dart` | 7 |
| Message Font Size | `lib/utilities/constants.dart` | 31 |
| Weather Icons | `lib/services/weather.dart` | 23-41 |
| Temperature Messages | `lib/services/weather.dart` | 43-53 |
| Location Accuracy | `lib/services/location.dart` | 17 |
| App Name (Android) | `android/.../AndroidManifest.xml` | 9 |
| App Name (iOS) | `ios/Runner/Info.plist` | 8 |
| Custom Font | `pubspec.yaml` | 78-82 |
| Background Images | `images/` folder | N/A |

---

## Assets Reference

### Images

| File | Dimensions | Used In | Purpose |
|------|------------|---------|---------|
| `location_background.jpg` | Full screen | LocationScreen | Main weather display background |
| `city_background.jpg` | Full screen | CityScreen | City search background |

### Fonts

| File | Family Name | Style | Weight |
|------|-------------|-------|--------|
| `SpartanMB-Black.otf` | Spartan | Italic | Black (900) |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0+1 | Initial | First release with core weather functionality |

---

## License

This project is for educational purposes.

---

*Documentation generated for future reference. Last updated: December 2024*
