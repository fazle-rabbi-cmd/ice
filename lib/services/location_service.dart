import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<LocationData?> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permission;

    // Check if location services are enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request to enable them
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Location services are still not enabled, return null
        return null;
      }
    }

    // Check location permission
    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      // Location permission is denied, request permission
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        // Location permission is still denied, return null
        return null;
      }
    }

    // Get the current location
    try {
      return await location.getLocation();
    } catch (e) {
      // Error getting location, return null
      print('Error getting location: $e');
      return null;
    }
  }
}
