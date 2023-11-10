import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_practice/models/weather_model.dart';
import 'package:weather_app_practice/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService("e03ae067c4af9060d65a71859a23ec44");
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    //get the current city
    String city = await _weatherService.getCurrentCity();

    //get the weather for city
    try {
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();

    _fetchWeather();
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/cloud.json';
      case 'mist':
      case 'smoke':
      case 'maze':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
        return 'assets/rain.json';
      case 'drizzle':
        return 'assets/rain.json';
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.grey[600],
                      size: 26,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      _weather?.cityName ?? "loading city...",
                      style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),

            //animation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/thunder2.json'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${_weather?.temperature.round()}˚C',
                    style: TextStyle(fontSize: 50, color: Colors.grey[800])),
              ],
            ),
          ]),
    );
  }
}
