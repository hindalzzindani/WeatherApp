import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weaatherapp/models/weather.dart';
class WeatherController {
  final String apiKey = 'a24ffffcb8a5b1abbff9dc882bef8ae7';

  Future<WeatherData> fetchWeatherData(String city) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final weatherJson = json.decode(response.body);
      return WeatherData.fromJson(weatherJson);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
