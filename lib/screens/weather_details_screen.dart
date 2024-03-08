import 'package:flutter/material.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display air quality level
              _buildWeatherDetail(
                  'Air Quality', 'Good' // Replace with actual air quality level
                  ),
              SizedBox(height: 20.0),
              // Display health risks
              _buildWeatherDetail(
                  'Health Risks', 'Low' // Replace with actual health risks
                  ),
              SizedBox(height: 20.0),
              // Display UV radiation level
              _buildWeatherDetail('UV Radiation Level',
                  'Moderate' // Replace with actual UV radiation level
                  ),
              SizedBox(height: 20.0),
              // Display pollen levels
              _buildWeatherDetail(
                'Pollen Levels',
                'High', // Replace with actual pollen levels
              ),
              SizedBox(height: 20.0),
              // Display pollen types and severity levels
              _buildPollenDetail(
                'Pollen Types',
                ['Oak', 'Grass', 'Birch'], // Replace with actual pollen types
              ),
              SizedBox(height: 10.0),
              _buildPollenDetail(
                'Severity Levels',
                [
                  'High',
                  'Medium',
                  'Low'
                ], // Replace with actual severity levels
              ),
              SizedBox(height: 20.0),
              // Display recommendations for sun protection
              Text(
                'Recommendations for Sun Protection:', // Add recommendations here
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              _buildRecommendation(
                  '- Wear sunscreen with SPF 30+' // Example recommendation
                  ),
              _buildRecommendation(
                  '- Wear sunglasses and a hat' // Example recommendation
                  ),
              // Add more recommendations as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Text(
          value,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }

  Widget _buildPollenDetail(String title, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values
              .map((value) => Text(value, style: TextStyle(fontSize: 18.0)))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildRecommendation(String recommendation) {
    return Text(
      recommendation,
      style: TextStyle(fontSize: 16.0),
    );
  }
}
