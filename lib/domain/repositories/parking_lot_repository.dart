import 'package:either_dart/either.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_time/data/models/api_response_model.dart';

import '../../data/models/api_page_response_model.dart';
import '../../data/models/light_parking_lot_model.dart';
import '../../data/models/parking_lot_model.dart';
import '../../utils/sortings/sorting.dart';
import '../../utils/typedef/exception_trace.dart';
import '../../utils/typedef/page.dart';

abstract interface class ParkingLotRepository {
  Future<Either<ExceptionTrace, Page<LightParkingLotModel>>> getParkingLots({
    required Sorting sorting,
    required int page,
    int? pageSize,
    required LatLng center,
    double? radius,
    String? keyword,
  });

  Future<Either<ExceptionTrace, ParkingLotModel>> getParkingLotDetail({required String id});
}
