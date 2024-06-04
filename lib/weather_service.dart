// import 'dart:convert';
// import 'package:http/http.dart' as http;
// class WeatherService {
//   Future<dynamic> getWeatherData(String endpoint, http.Client client) async {
//     final response = await client.get(Uri.parse(endpoint));
//
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }
// }