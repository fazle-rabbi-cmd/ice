import 'package:flutter/material.dart';

class DailyForecastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Forecast'),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          // Generate dummy daily forecast data
          String day = 'Day ${index + 1}';
          String temperature = '${20 + index}°C';
          IconData weatherIcon = index % 2 == 0 ? Icons.wb_sunny : Icons.cloud;
          Color weatherColor = index % 2 == 0 ? Colors.orange : Colors.blue;

          return ListTile(
            leading: Icon(weatherIcon, color: weatherColor),
            title: Text(day),
            subtitle: Text(temperature),
          );
        },
      ),
    );
  }
}
