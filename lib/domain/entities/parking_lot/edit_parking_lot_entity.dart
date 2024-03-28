import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';
import 'package:parking_time/domain/entities/parking_lot/parking_lot_entity.dart';

class UpdateParkingLotEntity extends BaseParkingLotEntity {

  final int id;

  final List<String> uploadImages;

  final List<String> deleteImages;

  const UpdateParkingLotEntity({
    required this.id,
    required super.name,
    required super.address,
    required super.parkingTime,
    required super.images,
    required this.uploadImages,
    required this.deleteImages,
  });

  factory UpdateParkingLotEntity.fromParkingLotEntity(ParkingLotEntity entity) => UpdateParkingLotEntity(
    id: entity.id,
    name: entity.name,
    address: entity.address,
    parkingTime: entity.parkingTime,
    images: entity.images,
    uploadImages: [],
    deleteImages: [],
  );
}