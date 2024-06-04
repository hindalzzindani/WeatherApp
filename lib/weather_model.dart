// class WeatherModel {
//   final String location;
//   final String temperature;
//   final String condition;
//
//   WeatherModel({required this.location, required this.temperature, required this.condition});
//
//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       location: json['location']['name'],
//       temperature: json['current']['temperature'].toString() + '°',
//       condition: json['current']['weather_descriptions'][0],
//     );
//   }
// }