import 'package:json_annotation/json_annotation.dart';
import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';

part 'parking_lot_entity.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ParkingLotEntity extends BaseParkingLotEntity {

  final int id;

  const ParkingLotEntity({
    required this.id,
    required super.name,
    required super.address,
    required super.parkingTime,
    required super.images,
  });

  factory ParkingLotEntity.fromJson(Map<String, dynamic> json) => _$ParkingLotEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParkingLotEntityToJson(this);
}