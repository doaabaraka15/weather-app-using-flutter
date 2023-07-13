import 'package:flutter/material.dart';

class Weather {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String country;

  Weather(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState,
      required this.country});

  factory Weather.fromJson(Map<String, dynamic> data) {
    var json = data['forecast']['forecastday'][0]['day'];
    return Weather(
        date: DateTime.parse(data['location']['localtime']),
        temp: json['avgtemp_c'],
        maxTemp: json['maxtemp_c'],
        minTemp: json['mintemp_c'],
        weatherState: json['condition']['text'],
        country: data['location']['name']);
  }

  MaterialColor themeColor() {
    if (weatherState == 'Thunderstorm' || weatherState == 'Thunder') {
      return Colors.blueGrey;
    } else if (weatherState == 'Snow' ||
        weatherState == 'Hail' ||
        weatherState == 'Sleet') {
      return Colors.blue;
    } else if (weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||weatherState == 'Patchy rain possible'||
        weatherState == 'Showers') {
      return Colors.blue;
    } else if (weatherState == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherState == 'Light Cloud' ||
        weatherState == 'Partly cloudy' ||
        weatherState == 'Clear') {
      return Colors.orange;
    } else {
      return Colors.orange;
    }
  }

  String getImage() {
    if (weatherState == 'Thunderstorm' || weatherState == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherState == 'Snow' ||
        weatherState == 'Hail' ||
        weatherState == 'Sleet') {
      return 'assets/images/snow.png';
    } else if (weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||weatherState == 'Patchy rain possible'||
        weatherState == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherState == 'Light Cloud' ||
        weatherState == 'Partly cloudy' ||
        weatherState == 'Clear') {
      return 'assets/images/cloudy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
