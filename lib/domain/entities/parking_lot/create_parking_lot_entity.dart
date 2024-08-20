import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_time/data/models/address_model.dart';
import 'package:parking_time/data/models/location_model.dart';
import 'package:parking_time/domain/entities/parking_lot/base_parking_lot_entity.dart';
import 'package:parking_time/utils/wrapper.dart';
import 'package:parking_time/utils/wrapper.dart';
import 'package:parking_time/utils/wrapper.dart';
import 'package:parking_time/utils/wrapper.dart';
import 'package:parking_time/utils/wrapper.dart';
import 'package:parking_time/utils/wrapper.dart';
import 'package:parking_time/utils/wrapper.dart';
import 'package:parking_time/utils/wrapper.dart';
import 'package:parking_time/utils/wrapper.dart';

import '../../../data/models/amount_day_weeks_model.dart';

class CreateParkingLotEntity extends BaseParkingLotEntity<({String imageUrl, bool isMainImage})> {

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

  CreateParkingLotEntity copyWith({
    Wrapper<String>? name,
    Wrapper<Duration>? openTime,
    Wrapper<Duration>? closeTime,
    Wrapper<AddressModel>? address,
    Wrapper<LatLng>? location,
    Wrapper<int>? acceptableQuantity,
    Wrapper<AmountDayWeeksModel>? amountDayWeeks,
    Wrapper<List<({String imageUrl, bool isMainImage})>>? images,
    Wrapper<List<ParkingLotType>>? types,
  }) => CreateParkingLotEntity(
    name: name?.value ?? this.name,
    openTime: openTime?.value ?? this.openTime,
    closeTime: closeTime?.value ?? this.closeTime,
    address: address?.value ?? this.address,
    images: images?.value ?? this.images,
    types: types?.value ?? this.types,
    location: location?.value ?? this.location,
    acceptableQuantity: acceptableQuantity?.value ?? this.acceptableQuantity,
    amountDayWeeks: amountDayWeeks?.value ?? this.amountDayWeeks,
  );
}