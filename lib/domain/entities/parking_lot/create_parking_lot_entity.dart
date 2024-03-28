import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';

class CreateParkingLotEntity extends BaseParkingLotEntity {

  const CreateParkingLotEntity({
    required super.name,
    required super.address,
    required super.parkingTime,
    required super.images,
  });

  factory CreateParkingLotEntity.init() => CreateParkingLotEntity(
    name: '',
    address: '',
    parkingTime: DateTime.now(),
    images: [],
  );
}