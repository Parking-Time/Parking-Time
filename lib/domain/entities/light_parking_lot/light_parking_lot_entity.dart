import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:parking_time/data/models/light_parking_lot_model.dart';
import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';

import '../../../data/models/address_model.dart';
import '../../../data/models/amount_day_weeks_model.dart';
import '../../../data/models/location_model.dart';

class LightParkingLotEntity {

  final int id;

  final String name;

  final Duration? openTime;

  final Duration? closeTime;

  final AddressModel address;

  final LatLng location;

  final int acceptableQuantity;

  final AmountDayWeeksModel? amountDayWeeks;

  final String image;

  final List<ParkingLotType> types;

  final int viewCount;

  const LightParkingLotEntity({
    required this.id,
    required this.name,
    required this.openTime,
    required this.closeTime,
    required this.address,
    required this.location,
    required this.acceptableQuantity,
    this.image = '',
    this.types = const[],
    required this.viewCount,
    this.amountDayWeeks,
  });

  AmountDayModel? get amountOfCurrentDay => switch (DateTime.now().weekday) {
    1 => amountDayWeeks?.mon,
    2 => amountDayWeeks?.tue,
    3 => amountDayWeeks?.wed,
    4 => amountDayWeeks?.thu,
    5 => amountDayWeeks?.fri,
    6 => amountDayWeeks?.sat,
    7 => amountDayWeeks?.sun,
    _ => null
  };

  factory LightParkingLotEntity.fromModel(LightParkingLotModel model) => LightParkingLotEntity(
    id: model.id,
    name: model.name,
    openTime: model.openTime != null ? Duration(seconds: model.openTime!) : null,
    closeTime: model.closeTime != null ? Duration(seconds: model.closeTime!) : null,
    address: model.address,
    location: model.location,
    acceptableQuantity: model.acceptableQuantity,
    viewCount: model.viewCount,
    image: model.image,
    types: model.types.map((e) => ParkingLotType.values[e]).toList(),
    amountDayWeeks: model.amountDayWeeks,
  );

  @override
  String toString() => 'ParkingLotLightEntity{id: $id, name: $name, address: $address, location: $location, acceptableQuantity: $acceptableQuantity, image: $image, viewCount: $viewCount}';
}