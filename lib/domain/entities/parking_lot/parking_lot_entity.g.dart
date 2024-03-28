// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_lot_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingLotEntity _$ParkingLotEntityFromJson(Map<String, dynamic> json) =>
    ParkingLotEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      parkingTime: DateTime.parse(json['parking_time'] as String),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ParkingLotEntityToJson(ParkingLotEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'parking_time': instance.parkingTime.toIso8601String(),
      'images': instance.images,
      'id': instance.id,
    };
