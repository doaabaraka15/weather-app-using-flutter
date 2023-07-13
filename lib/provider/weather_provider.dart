import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/weather.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weather;

  set weather(Weather? weatherData) {
    _weather = weatherData;
    notifyListeners();
  }

  Weather? get weather => _weather;





}
