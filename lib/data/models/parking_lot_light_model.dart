import 'package:json_annotation/json_annotation.dart';

import 'location_model.dart';

part 'parking_lot_light_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ParkingLotLightModel {
  final String id;

  final int acceptableQuantity;

  final String name;

  final String address;

  final LocationModel location;

  final int viewCount;

  ParkingLotLightModel({
    required this.id,
    required this.acceptableQuantity,
    required this.name,
    required this.address,
    required this.location,
    required this.viewCount,
  });

  factory ParkingLotLightModel.fromJson(Map<String, dynamic> json) => _$ParkingLotLightModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParkingLotLightModelToJson(this);
}
