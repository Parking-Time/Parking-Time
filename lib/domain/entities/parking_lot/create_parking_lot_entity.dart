import 'package:parking_time/data/models/location_model.dart';
import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';

class CreateParkingLotEntity extends BaseParkingLotEntity {

  const CreateParkingLotEntity({
    required super.name,
    required super.address,
    required super.images,
    required super.location,
    required super.acceptableQuantity,
    super.amountDayWeeks,
  });

  factory CreateParkingLotEntity.init() => const CreateParkingLotEntity(
    name: '',
    address: '',
    images: [],
    location: LocationModel(geopoint: LatLngModel(latitude: 37.55126953, longitude: 126.93603516), geohash: 'wydm8'),
    acceptableQuantity: 0,
  );
}