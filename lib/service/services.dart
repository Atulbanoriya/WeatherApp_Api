import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_data.dart';

class WeatherService {
  fetchWeather() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=26.218287&lon=78.182831&appid=d3ef948fbe4b55da11162ddf7c010aa6"));
    try{
      if(response.statusCode == 200){
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      }else{
        throw Exception('Failed to load Weather Data');
      }
    }catch(e){
       if (kDebugMode) {
         print(e.toString());
       }
    }
  }
}
