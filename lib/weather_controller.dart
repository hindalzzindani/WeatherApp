// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'weather_model.dart';
// import 'weather_view.dart';
//
// class WeatherController {
//   WeatherModel? weatherModel;
//
//   Future<void> fetchWeatherData() async {
//     final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_API_KEY'));
//
//     if (response.statusCode == 200) {
//       weatherModel = WeatherModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }
// }