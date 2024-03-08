import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart'; // Import your Weather model

class WeatherService {
  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  static const String _apiKey =
      'c0d1009550c934bb96a545c2d2f38878'; // Replace with your OpenWeatherMap API key

  static String getWindDirection(double degree) {
    const directions = [
      'N',
      'NNE',
      'NE',
      'ENE',
      'E',
      'ESE',
      'SE',
      'SSE',
      'S',
      'SSW',
      'SW',
      'WSW',
      'W',
      'WNW',
      'NW',
      'NNW'
    ];

    final index = ((degree + 11.25) % 360 / 22.5).floor();
    return directions[index % 16];
  }

  static Future<Weather> fetchWeather(double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?lat=$latitude&lon=$longitude&units=metric&appid=$_apiKey'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      // Extract weather data from JSON
      final weather = Weather(
        location: jsonData['name'],
        temperature: jsonData['main']['temp'].toDouble(),
        feelsLike: jsonData['main']['feels_like'].toDouble(),
        precipitation: jsonData['weather'][0]['main'],
        windSpeed: jsonData['wind']['speed'].toDouble(),
        windDirection:
            getWindDirection(jsonData['wind']['deg']), // Get wind direction
        chanceOfRain: jsonData['clouds']['all'],
        humidity: jsonData['main']['humidity'],
        pressure: jsonData['main']['pressure'],
        sunrise: formatTime(DateTime.fromMillisecondsSinceEpoch(
            jsonData['sys']['sunrise'] * 1000,
            isUtc: true)),
        sunset: formatTime(DateTime.fromMillisecondsSinceEpoch(
            jsonData['sys']['sunset'] * 1000,
            isUtc: true)),
        minTemperature: jsonData['main']['temp_min'].toDouble(),
        maxTemperature: jsonData['main']['temp_max'].toDouble(),
      );

      return weather;
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  static String formatTime(DateTime time) {
    // Format time into AM/PM format
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
