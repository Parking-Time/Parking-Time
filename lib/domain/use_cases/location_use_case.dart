import 'package:geolocator/geolocator.dart';
import 'package:parking_time/data/models/location_model.dart';

class LocationUseCase {

  // LatLngBounds getExpandLatLngBounds(double expendPixel, LatLng center, double zoomLevel) {
  //   double lonPerPixel = 360 / (256 * pow(2, zoomLevel));
  //   double latPerPixel = ((156543.03392 * cos(center.latitude * pi / 180)) / pow(2, zoomLevel)) / 111320;
  //
  //   double latOffset = latPerPixel * (expendPixel / 2);
  //   double lonOffset = lonPerPixel * (expendPixel / 2);
  //
  //   LatLng southwest = LatLng(center.latitude - latOffset, center.longitude - lonOffset);
  //   LatLng northeast = LatLng(center.latitude + latOffset, center.longitude + lonOffset);
  //
  //   return LatLngBounds(southwest: southwest, northeast: northeast);
  // }

  Future<LatLngModel> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    return LatLngModel(latitude: position.latitude, longitude: position.longitude);
  }

  Future<LatLngModel> getFastUserCurrentLocation() async {
    final Position? position = await Geolocator.getLastKnownPosition();
    if (position == null) return getCurrentLocation();
    return LatLngModel(latitude: position.latitude, longitude: position.longitude);
  }

}