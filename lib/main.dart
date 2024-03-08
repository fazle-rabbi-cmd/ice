import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ice/models/theme_model.dart';
import 'package:ice/models/locale_model.dart'; // Import the LocaleModel class

import 'screens/home_screen.dart';
import 'screens/hourly_forecast_screen.dart';
import 'screens/daily_forecast_screen.dart';
import 'screens/extended_forecast_screen.dart';
import 'screens/location_management_screen.dart';
import 'screens/search_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/severe_weather_alerts.dart';
import 'screens/weather_details_screen.dart';
import 'screens/weather_map_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(
            create: (_) => LocaleModel()), // Provide the LocaleModel here
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICE',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Hourly'),
              Tab(text: 'Daily'),
              Tab(text: 'Extended'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            HourlyForecastScreen(),
            DailyForecastScreen(),
            ExtendedForecastScreen(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Location Management'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationManagementScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Search Locations'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Weather Map'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherMapScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Weather Details'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherDetailsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Alerts'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SevereWeatherAlerts(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
