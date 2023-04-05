import 'package:flutter/material.dart';

const apiKey = 'e364cb71360b7c32508f3c6abdcdbb00';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const ktempTextStyle = TextStyle(
  fontFamily: 'Spartan',
  fontSize: 100.0,
);

const kCityNameInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
