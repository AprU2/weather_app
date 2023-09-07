import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:my_app/model/weather_model.dart';

class WeatherRepositories {
  Future<Weather>? getCurrentWeather(String location) async {
    final locationUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=1a6a4513d508084229283f9464e567ef&units=metric';
    final weatherRequest = Uri.parse(locationUrl);
    var weatherResponse = await http.get(weatherRequest);
    var body = jsonDecode(weatherResponse.body);
    return Weather.fromJson(body);
  }
}
