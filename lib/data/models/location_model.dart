import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LocationModel {
  final String geohash;

  final LatLngModel geopoint;

  const LocationModel({
    required this.geohash,
    required this.geopoint,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LatLngModel {
  final double latitude;

  final double longitude;

  const LatLngModel({
    required this.latitude,
    required this.longitude,
  });

  factory LatLngModel.fromJson(Map<String, dynamic> json) => _$LatLngModelFromJson(json);

  Map<String, dynamic> toJson() => _$LatLngModelToJson(this);
}
