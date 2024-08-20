import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';

class ParkingLotEntity extends BaseParkingLotEntity {

  final String id;

  final int viewCount;

  final List<String> reservedPlaces;

  const ParkingLotEntity({
    required this.id,
    required super.name,
    super.openTime,
    super.closeTime,
    required super.address,
    required super.location,
    required super.acceptableQuantity,
    super.amountDayWeeks,
    super.images = const [''],
    required this.viewCount,
    this.reservedPlaces = const [],
    super.types = const [],
  });

}