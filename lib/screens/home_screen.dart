import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: WeatherInfo(), // Display weather information
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Current Location',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny,
                size: 64.0,
                color: Colors
                    .orange), // Weather icon (replace with dynamic icon based on weather condition)
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temperature: 25°C', // Replace with actual temperature
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Feels Like: 28°C', // Replace with actual feels-like temperature
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Precipitation: Rain', // Replace with actual precipitation type and amount
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Wind: 10 km/h NE', // Replace with actual wind speed and direction
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Chance of Rain: 60%', // Replace with actual chance of rain
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Humidity: 70%', // Replace with actual humidity
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Pressure: 1013 hPa', // Replace with actual pressure
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Sunrise: 6:30 AM', // Replace with actual sunrise time
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Sunset: 6:00 PM', // Replace with actual sunset time
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Min Temperature: 20°C', // Replace with actual min temperature
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Max Temperature: 30°C', // Replace with actual max temperature
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
