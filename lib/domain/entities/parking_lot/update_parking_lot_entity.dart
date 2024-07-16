import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';
import 'package:parking_time/domain/entities/parking_lot/parking_lot_entity.dart';

import '../../../data/models/amount_day_weeks_model.dart';

class UpdateParkingLotEntity extends BaseParkingLotEntity {

  final String id;

  final List<String> uploadImages;

  final List<String> deleteImages;

  final List<String> reservedPlaces;

  final List<int> types;

  const UpdateParkingLotEntity({
    required this.id,
    required super.name,
    required super.address,
    required super.location,
    required super.acceptableQuantity,
    required super.amountDayWeeks,
    required super.images,
    required this.reservedPlaces,
    required this.types,
    required this.uploadImages,
    required this.deleteImages,
  });

  factory UpdateParkingLotEntity.fromParkingLotEntity(ParkingLotEntity entity) => UpdateParkingLotEntity(
    id: entity.id,
    name: entity.name,
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