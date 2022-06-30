import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double Latitude = 0;
  double Longitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {}
  }
}
