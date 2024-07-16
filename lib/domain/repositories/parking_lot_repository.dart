import 'package:either_dart/either.dart';
import 'package:parking_time/common/sortings/sorting.dart';

import '../../common/typedef/exception_trace.dart';
import '../../data/models/api_page_response_model.dart';
import '../../data/models/parking_lot_light_model.dart';
import '../../data/models/parking_lot_model.dart';

abstract interface class ParkingLotRepository {
  Future<Either<ExceptionTrace, ApiPageResponseModel<ParkingLotLightModel>>> getParkingLots({required int page, required int pageSize, required Sorting sorting});

  Future<Either<ExceptionTrace, ParkingLotModel>> getParkingLotDetail({required String id});
}