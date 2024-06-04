import 'package:hive/hive.dart';

part 'weather.g.dart';

@HiveType(typeId: 0)
class WeatherData {
  @HiveField(0)
  String city;

  @HiveField(1)
  double temperature;

  @HiveField(2)
  double windSpeed;

  @HiveField(3)
  String description;

  @HiveField(4)
  int humidity;

  @HiveField(5)
  int cloudiness;

  WeatherData({
    required this.city,
    required this.temperature,
    required this.windSpeed,
    required this.description,
    required this.humidity,
    required this.cloudiness,
  });

  // دالة fromJson لتحويل JSON إلى كائن WeatherData
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['name'],
      temperature: json['main']['temp'],
      windSpeed: json['wind']['speed'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      cloudiness: json['clouds']['all'],
    );
  }
}
