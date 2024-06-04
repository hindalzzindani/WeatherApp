// import 'package:flutter/material.dart';
//
// import '../models/weather.dart';
//
// class DetailsScreen extends StatelessWidget {
//   final Weather _selectedWeather;
//
//   DetailsScreen(this._selectedWeather);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_selectedWeather.day),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Air Quality: Moderate'),
//             SizedBox(height: 16),
//             Text('Temperature: ${_selectedWeather.temperature}°'),
//             SizedBox(height: 16),
//             Text('Condition: ${_selectedWeather.condition}'),
//           ],
//         ),
//       ),
//     );
//   }
// }