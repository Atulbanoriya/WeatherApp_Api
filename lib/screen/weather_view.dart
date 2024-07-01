import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/screen/weatherdeatils.dart';
import 'package:weather_app/service/services.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  WeatherData? weatherInfo;

  void myWeather() {
    WeatherService().fetchWeather().then((value) {
      setState(() {
        weatherInfo = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    myWeather();
  }

  @override
  Widget build(BuildContext context) {

    String formattedDate = DateFormat('EEEE D,MMMM yyyy').format(DateTime.now());

    String formattedTime = DateFormat('HH:mm a').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xff87CEEB),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: weatherInfo == null
                  ? const CircularProgressIndicator()
                  : Weatherdeatils(weather: weatherInfo!, formattedDate: formattedDate, formattedTime: formattedTime ,),
            ),
          ],
        ),
      ),
    );
  }
}
