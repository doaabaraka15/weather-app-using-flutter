import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

import '../models/weather.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weather;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
         leading: Icon(Icons.arrow_back, color: weatherData?.themeColor(),),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              // color: Provider.of<WeatherProvider>(context).weather!.themeColor(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData!.themeColor(),
                    weatherData!.themeColor().shade200,
                    weatherData!.themeColor().shade500,
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      weatherData?.country ?? '',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Updated at : ${weatherData?.date.hour}:${weatherData?.date.minute} ',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(Provider.of<WeatherProvider>(context)
                            .weather!
                            .getImage()),
                        Text(
                          '${weatherData?.temp.toInt()}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text(
                              'max: ${weatherData?.maxTemp.toInt()}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'min: ${weatherData?.minTemp.toInt()}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      weatherData!.weatherState,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
