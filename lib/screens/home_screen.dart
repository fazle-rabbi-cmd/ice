import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Weather> _weatherFuture;
  final Location _location = Location();

  @override
  void initState() {
    super.initState();
    _weatherFuture = _fetchWeather();
  }

  Future<Weather> _fetchWeather() async {
    try {
      final locationData = await _location.getLocation();
      final latitude = locationData.latitude!;
      final longitude = locationData.longitude!;
      return WeatherService.fetchWeather(latitude, longitude);
    } catch (e) {
      print('Error getting location: $e');
      throw e; // Rethrow the error to handle it in FutureBuilder
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: _weatherFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final weather = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Current Location: ${weather.location}',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wb_sunny,
                    size: 64.0,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temperature: ${weather.temperature}°C',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Feels Like: ${weather.feelsLike}°C',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Precipitation: ${weather.precipitation}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Wind: ${weather.windSpeed} km/h ${weather.windDirection}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Chance of Rain: ${weather.chanceOfRain}%',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Humidity: ${weather.humidity}%',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Pressure: ${weather.pressure} hPa',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Sunrise: ${weather.sunrise}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Sunset: ${weather.sunset}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Min Temperature: ${weather.minTemperature}°C',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Max Temperature: ${weather.maxTemperature}°C',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else {
          return Text('No data');
        }
      },
    );
  }
}
