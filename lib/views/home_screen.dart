import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weaatherapp/controllers/home_controller.dart';
import 'package:weaatherapp/models/weather.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherController _controller = WeatherController();
  late Future<WeatherData> weatherData;
  final String city = 'Kolkata';

  @override
  void initState() {
    super.initState();
    weatherData = _controller.fetchWeatherData(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.nights_stay, color: Colors.grey),
          ),
        ],
      ),
      body: FutureBuilder<WeatherData>(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final weatherData = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    _buildCurrentWeatherCard(weatherData),
                    SizedBox(height: 20),
                    _buildTodayDetails(weatherData),
                    SizedBox(height: 20),
                    _buildForecast(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildCurrentWeatherCard(WeatherData weatherData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            weatherData.city.toUpperCase(),
            style: GoogleFonts.lato(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'TODAY, ${DateTime.now().toString().split(' ')[0]}',
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${weatherData.temperature}°C',
                style: GoogleFonts.lato(
                  fontSize: 64,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    weatherData.description.toUpperCase(),
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'WIND ${weatherData.windSpeed} km/h',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTodayDetails(WeatherData weatherData) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailItem(
                icon: Icons.wb_sunny,
                value: '${weatherData.windSpeed} km/h',
                label: 'SUNNY',
              ),
              _buildDetailItem(
                icon: Icons.opacity,
                value: '${weatherData.humidity}%',
                label: 'HUMIDITY',
              ),
              _buildDetailItem(
                icon: Icons.cloud,
                value: '${weatherData.cloudiness}%',
                label: 'CLOUD',
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailItem(
                icon: Icons.wb_sunny,
                value: '5:34 AM',
                label: 'SUN RISE',
              ),
              _buildDetailItem(
                icon: Icons.thermostat,
                value: '${weatherData.temperature}°C',
                label: 'TEMP',
              ),
              _buildDetailItem(
                icon: Icons.wb_sunny,
                value: '5:00 PM',
                label: 'SUN SET',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem({required IconData icon, required String value, required String label}) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(height: 10),
        Text(
          value,
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildForecast() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherDayCard(day: 'MON', date: '16/02', temperature: 22, aqi: 193, icon: Icons.water_drop),
        WeatherDayCard(day: 'TODAY', date: '17/02', temperature: 22, aqi: 193, icon: Icons.cloud),
        WeatherDayCard(day: 'WED', date: '18/02', temperature: 27, aqi: 150, icon: Icons.wb_sunny),
        WeatherDayCard(day: 'THU', date: '19/02', temperature: 28, aqi: 78, icon: Icons.wb_cloudy),
      ],
    );
  }
}

class WeatherDayCard extends StatelessWidget {
  final String day;
  final String date;
  final int temperature;
  final int aqi;
  final IconData icon;

  const WeatherDayCard({
    Key? key,
    required this.day,
    required this.date,
    required this.temperature,
    required this.aqi,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day, style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(date, style: GoogleFonts.lato(fontSize: 14, color: Colors.grey)),
        SizedBox(height: 10),
        Icon(icon, color: Colors.blue, size: 30),
        SizedBox(height: 10),
        Text('${temperature}°C', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.yellow.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('$aqi', style: GoogleFonts.lato(fontSize: 14, color: Colors.yellow.shade700)),
        ),
      ],
    );
  }
}