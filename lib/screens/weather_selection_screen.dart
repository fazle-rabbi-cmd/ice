import 'package:flutter/material.dart';

class WeatherSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Weather Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to date selection screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DateSelectionScreen(),
                  ),
                );
              },
              child: Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}

class DateSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to location selection screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationSelectionScreen(),
                  ),
                );
              },
              child: Text('Select Location'),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to weather details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherDetailsScreen(),
                  ),
                );
              },
              child: Text('View Weather Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Center(
        child: Text('Weather details will be displayed here.'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WeatherSelectionScreen(),
  ));
}
