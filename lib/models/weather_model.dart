class Weather {
  final String location;
  final double temperature;
  final double feelsLike;
  final String precipitation;
  final double windSpeed;
  final String windDirection;
  final int chanceOfRain;
  final int humidity;
  final int pressure;
  final String sunrise;
  final String sunset;
  final double minTemperature;
  final double maxTemperature;

  Weather({
    required this.location,
    required this.temperature,
    required this.feelsLike,
    required this.precipitation,
    required this.windSpeed,
    required this.windDirection,
    required this.chanceOfRain,
    required this.humidity,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
    required this.minTemperature,
    required this.maxTemperature,
  });
}
