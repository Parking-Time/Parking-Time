// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'location_model.g.dart';
//
// @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
// class LocationModel {
//   final String geohash;
//
//   @JsonKey(toJson: _geopointToJson, fromJson: _geopointFromJson)
//   final LatLng geopoint;
//
//   const LocationModel({
//     required this.geohash,
//     required this.geopoint,
//   });
//
//   factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$LocationModelToJson(this);
//
//   static LatLng _geopointFromJson(GeoPoint geopoint) => LatLng(geopoint.latitude, geopoint.longitude);
//
//   static GeoPoint _geopointToJson(LatLng latlng) => GeoPoint(latlng.latitude, latlng.longitude);
// }