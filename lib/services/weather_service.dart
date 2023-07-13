import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '58d7799b40d144d9a4373144230707';

  Future<Weather?> getWeather({required String city}) async {
    http.Response response = await http.get(Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$city&days=7'));
    try {
      Map<String, dynamic> data = jsonDecode(response.body);
      return Weather.fromJson(data);
    } catch (e){
      print(e);
    }
  }
}
