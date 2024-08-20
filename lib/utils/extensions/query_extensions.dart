import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension QueryExtensions<T> on Query<T> {
  Query<T> whereInArea({required String latitudeField, required String longitudeField, required LatLngBounds area}) =>
      where(latitudeField, isGreaterThanOrEqualTo: area.southwest.latitude)
      .where(latitudeField, isLessThanOrEqualTo: area.northeast.latitude)
      .where(longitudeField, isGreaterThanOrEqualTo: area.southwest.longitude)
      .where(longitudeField, isLessThanOrEqualTo: area.northeast.longitude);
}