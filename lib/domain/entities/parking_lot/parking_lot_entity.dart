import 'package:json_annotation/json_annotation.dart';
import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';

class ParkingLotEntity extends BaseParkingLotEntity {

  final String id;

  final int viewCount;

  final List<String> reservedPlaces;

  final List<int> types;

  const ParkingLotEntity({
    required this.id,
    required super.name,
    required super.address,
    required super.location,
    required super.acceptableQuantity,
    super.amountDayWeeks,
    super.images = const [''],
    required this.viewCount,
    this.reservedPlaces = const [],
    this.types = const [],
  });

}