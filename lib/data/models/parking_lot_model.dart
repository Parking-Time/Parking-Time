import 'package:json_annotation/json_annotation.dart';
import 'package:parking_time/data/models/amount_day_weeks_model.dart';
import 'package:parking_time/data/models/location_model.dart';

part 'parking_lot_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ParkingLotModel {
  final String id;

  final int acceptableQuantity;

  final String name;

  final String address;

  final LocationModel location;

  final int viewCount;

  final List<String>? images;

  final AmountDayWeeksModel? amountDayWeeks;

  final List<String>? reservedPlaces;

  final List<int>? types;

  ParkingLotModel({
    required this.id,
    required this.acceptableQuantity,
    required this.name,
    required this.address,
    required this.location,
    required this.viewCount,
    this.images,
    this.amountDayWeeks,
    this.reservedPlaces,
    this.types,
  });

  factory ParkingLotModel.fromJson(Map<String, dynamic> json) => _$ParkingLotModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParkingLotModelToJson(this);
}
