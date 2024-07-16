import 'package:json_annotation/json_annotation.dart';
import 'package:parking_time/data/models/parking_lot_light_model.dart';
import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';

class ParkingLotLightEntity extends BaseParkingLotEntity {

  final String id;

  final int viewCount;

  String get mainImage => images.isNotEmpty ? images.first : '';

  const ParkingLotLightEntity({
    required this.id,
    required super.name,
    required super.address,
    required super.location,
    required super.acceptableQuantity,
    super.images = const [''],
    required this.viewCount,
  });

  factory ParkingLotLightEntity.fromModel(ParkingLotLightModel model) => ParkingLotLightEntity(
    id: model.id,
    name: model.name,
    address: model.address,
    location: model.location,
    acceptableQuantity: model.acceptableQuantity,
    viewCount: model.viewCount,
  );

}