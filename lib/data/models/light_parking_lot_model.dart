import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:parking_time/data/models/address_model.dart';
import 'package:parking_time/data/models/amount_day_weeks_model.dart';

part 'light_parking_lot_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LightParkingLotModel {
  final String id;

  final int acceptableQuantity;

  final int? openTime;

  final int? closeTime;

  final String name;

  final AddressModel address;

  @JsonKey(fromJson: _fromJsonLocation)
  final LatLng location;

  final int viewCount;

  final AmountDayWeeksModel? amountDayWeeks;

  final String image;

  final List<int> types;

  LightParkingLotModel({
    required this.id,
    required this.acceptableQuantity,
    this.openTime,
    this.closeTime,
    required this.name,
    required this.address,
    required this.location,
    required this.viewCount,
    required this.image,
    required this.types,
    this.amountDayWeeks,
  });

  factory LightParkingLotModel.fromJson(Map<String, dynamic> json) => _$LightParkingLotModelFromJson(json);

  Map<String, dynamic> toJson() => _$LightParkingLotModelToJson(this);

  static LatLng _fromJsonLocation(Object? json) => LatLng.fromJson(json)!;
}
