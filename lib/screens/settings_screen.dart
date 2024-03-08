import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/theme_model.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Theme'),
            subtitle: DropdownButton<String>(
              value: Provider.of<ThemeModel>(context).currentTheme ==
                      ThemeData.light()
                  ? 'Light'
                  : 'Dark',
              onChanged: (String? newValue) {
                if (newValue == 'Light') {
                  Provider.of<ThemeModel>(context, listen: false)
                      .setTheme(ThemeData.light());
                } else if (newValue == 'Dark') {
                  Provider.of<ThemeModel>(context, listen: false)
                      .setTheme(ThemeData.dark());
                }
              },
              items: ['Light', 'Dark']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Units'),
            subtitle: DropdownButton<String>(
              value: 'Celsius',
              onChanged: (String? newValue) {
                // Implement logic to save units preference
              },
              items: ['Celsius', 'Fahrenheit']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Language'),
            subtitle: DropdownButton<String>(
              value: 'English',
              onChanged: (String? newValue) {
                // Implement logic to save language preference
              },
              items: ['English', 'Spanish', 'French']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Notification Preferences'),
            trailing: Switch(
              value: true, // Example value, replace with actual preference
              onChanged: (bool value) {
                // Implement logic to save notification preference
              },
            ),
          ),
          ListTile(
            title: Text('Data Refresh Interval'),
            subtitle: Slider(
              value: 5, // Example value, replace with actual preference
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (double value) {
                // Implement logic to save data refresh interval
              },
            ),
          ),
        ],
      ),
    );
  }
}
