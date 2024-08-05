import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_time/data/models/address_model.dart';
import 'package:parking_time/data/models/amount_day_weeks_model.dart';

import '../../../data/models/location_model.dart';
import '../../../presentation/resources/app_colors.dart';

enum ParkingLotType {
  mechanical(title: '기계식', titleColor: kBlue2, backgroundColor: kBlue9),
  onlyCard(title: '카드 전용', titleColor: kGreen2, backgroundColor: kGreen9),
  onlyPaperMoney(title: '현금 전용', titleColor: kGreen2, backgroundColor: kGreen9);

  const ParkingLotType({required this.title, required this.titleColor, required this.backgroundColor});

  final String title;

  final Color titleColor;

  final Color backgroundColor;
}

abstract class BaseParkingLotEntity {

  final String name;

  final Duration? openTime;

  final Duration? closeTime;

  final AddressModel address;

  final LatLng location;

  final int acceptableQuantity;

  final AmountDayWeeksModel? amountDayWeeks;

  final List<String> images;

  final List<ParkingLotType> types;

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

  const BaseParkingLotEntity({
    required this.name,
    this.openTime,
    this.closeTime,
    required this.address,
    required this.location,
    required this.acceptableQuantity,
    this.amountDayWeeks,
    required this.images,
    required this.types,
  });
}