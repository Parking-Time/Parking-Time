import 'package:parking_time/data/models/amount_day_weeks_model.dart';

import '../../../data/models/location_model.dart';

abstract class BaseParkingLotEntity {

  final String name;

  final String address;

  final LocationModel location;

  final int acceptableQuantity;

  final AmountDayWeeksModel? amountDayWeeks;

  final List<String> images;

  const BaseParkingLotEntity({
    required this.name,
    required this.address,
    required this.location,
    required this.acceptableQuantity,
    this.amountDayWeeks,
    required this.images,
  });
}