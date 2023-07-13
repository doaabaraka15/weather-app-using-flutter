import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  TextEditingController searchedCity = TextEditingController();

  VoidCallback? update;

  late String cityName;

  SearchPage({Key? key, this.update}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: TextField(
            controller: searchedCity,
            onChanged: (data) async {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              Weather? weather = await service.getWeather(city: cityName);
              Provider.of<WeatherProvider>(context, listen: false).weather =
                  weather!;
              Navigator.pop(context);
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                label: const Text(
                  'Search',
                  style: TextStyle(color: Colors.orange),
                ),
                hintText: 'Enter City Name',
                hintStyle: const TextStyle(fontSize: 15),
                suffixIcon: IconButton(
                  onPressed: () async {
                    WeatherService service = WeatherService();
                    Weather? weather = await service.getWeather(city: cityName);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weather = weather!;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.black,
                ),
                helperStyle: const TextStyle(fontSize: 18),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange))),
          ),
        ),
      ),
    );
  }

  Future<void> search(BuildContext context) async {}
}
