import 'package:flutter/material.dart';

class SevereWeatherAlerts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Severe Weather Alerts'),
      ),
      body: Center(
        child: Text(
          'Severe weather alerts content goes here.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
