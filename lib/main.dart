import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weaatherapp/views/home_screen.dart';
import 'models/weather.dart';
// استيراد فئة الطقس ومحول البيانات

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherDataAdapter()); // استخدام المحول الذي تم توليده
  await Hive.openBox<WeatherData>('weatherBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}
