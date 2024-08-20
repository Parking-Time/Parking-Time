import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final locationUseCase = Provider((ref) => LocationUseCase());

class LocationUseCase {

  LatLngBounds getExpandLatLngBoundsWithPixel(double expendPixel, LatLng center, double zoomLevel) {
    double lonPerPixel = 360 / (256 * pow(2, zoomLevel));
    double latPerPixel = ((156543.03392 * cos(center.latitude * pi / 180)) / pow(2, zoomLevel)) / 111320;

    double latOffset = latPerPixel * (expendPixel / 2);
    double lonOffset = lonPerPixel * (expendPixel / 2);

    LatLng southwest = LatLng(center.latitude - latOffset, center.longitude - lonOffset);
    LatLng northeast = LatLng(center.latitude + latOffset, center.longitude + lonOffset);

    return LatLngBounds(southwest: southwest, northeast: northeast);
  }

  LatLngBounds getExpandLatLngBoundsWithMeters(LatLng center, double meters) {
    const double earthRadius = 6378137.0;
    double lat = center.latitude;
    double lng = center.longitude;

    double offsetLat = (meters / earthRadius) * (180 / pi);
    double offsetLng = (meters / (earthRadius * cos(pi * lat / 180))) * (180 / pi);

    LatLng northEast = LatLng(lat + offsetLat, lng + offsetLng);
    LatLng southWest = LatLng(lat - offsetLat, lng - offsetLng);

    return LatLngBounds(southwest: southWest, northeast: northEast);
  }

  Future<LatLng> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    return LatLng(position.latitude, position.longitude);
  }

  Future<LatLng> getFastUserCurrentLocation() async {
    final Position? position = await Geolocator.getLastKnownPosition();
    if (position == null) return getCurrentLocation();
    return LatLng(position.latitude, position.longitude);
  }

}