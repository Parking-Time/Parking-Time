import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_time/data/models/address_model.dart';
import 'package:parking_time/data/models/location_model.dart';
import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';

class CreateParkingLotEntity extends BaseParkingLotEntity {

  const CreateParkingLotEntity({
    required super.name,
    super.openTime,
    super.closeTime,
    required super.address,
    required super.images,
    required super.types,
    required super.location,
    required super.acceptableQuantity,
    super.amountDayWeeks,
  });

  factory CreateParkingLotEntity.init() => CreateParkingLotEntity(
    name: '',
    address: AddressModel.init(),
    images: [],
    types: [],
    location: const LatLng(37.55126953, 126.93603516),
    acceptableQuantity: 0,
  );
}