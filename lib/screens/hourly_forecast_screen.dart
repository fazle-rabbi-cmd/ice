import 'package:flutter/material.dart';

class HourlyForecastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hourly Forecast'),
      ),
      body: ListView.builder(
        itemCount: 24,
        itemBuilder: (BuildContext context, int index) {
          // Generate dummy hourly forecast data
          String time = '${index + 1}:00';
          String temperature = '${20 + index}°C';
          IconData weatherIcon = index % 2 == 0 ? Icons.wb_sunny : Icons.cloud;
          Color weatherColor = index % 2 == 0 ? Colors.orange : Colors.blue;

          return ListTile(
            leading: Icon(weatherIcon, color: weatherColor),
            title: Text(time),
            subtitle: Text(temperature),
          );
        },
      ),
    );
  }
}
