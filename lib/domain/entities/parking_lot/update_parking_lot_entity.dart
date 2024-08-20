import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';
import 'package:parking_time/domain/entities/parking_lot/parking_lot_entity.dart';

import '../../../data/models/amount_day_weeks_model.dart';

class UpdateParkingLotEntity extends BaseParkingLotEntity {

  final String id;

  final List<String> uploadImages;

  final List<String> deleteImages;

  final List<String> reservedPlaces;

  const UpdateParkingLotEntity({
    required this.id,
    required super.name,
    super.openTime,
    super.closeTime,
    required super.address,
    required super.location,
    required super.acceptableQuantity,
    required super.amountDayWeeks,
    required super.images,
    required super.types,
    required this.reservedPlaces,
    required this.uploadImages,
    required this.deleteImages,
  });

  factory UpdateParkingLotEntity.fromParkingLotEntity(ParkingLotEntity entity) => UpdateParkingLotEntity(
    id: entity.id,
    name: entity.name,
    openTime: entity.openTime,
    closeTime: entity.closeTime,
    address: entity.address,
    location: entity.location,
    acceptableQuantity: entity.acceptableQuantity,
    amountDayWeeks: entity.amountDayWeeks,
    images: entity.images,
    uploadImages: [],
    deleteImages: [],
    reservedPlaces: entity.reservedPlaces,
    types: entity.types,
  );
}