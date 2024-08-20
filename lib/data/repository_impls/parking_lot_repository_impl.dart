import 'package:either_dart/src/either.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:parking_time/data/models/light_parking_lot_model.dart';
import 'package:parking_time/data/models/parking_lot_model.dart';
import 'package:parking_time/data/service/parking_lot_service.dart';
import 'package:parking_time/domain/repositories/parking_lot_repository.dart';
import 'package:parking_time/utils/extensions/future_api_response_extensions.dart';
import 'package:parking_time/utils/sortings/sorting.dart';
import 'package:parking_time/utils/typedef/exception_trace.dart';

import '../../utils/typedef/page.dart';


class ParkingLotRepositoryImpl implements ParkingLotRepository {
  final ParkingLotService parkingLotService;

  ParkingLotRepositoryImpl({required this.parkingLotService});

  @override
  Future<Either<ExceptionTrace, ParkingLotModel>> getParkingLotDetail({required String id}) {
    // TODO: implement getParkingLotDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<ExceptionTrace, Page<LightParkingLotModel>>> getParkingLots({required Sorting sorting, required int page, int? pageSize, required LatLng center, double? radius, String? keyword}) async {
    return await parkingLotService.getParkingLots(
      sorting: sorting.argument,
      page: page,
      pageSize: pageSize,
      center: '${center.latitude},${center.longitude}',
      distance: radius,
      keyword: keyword,
    ).toPageDataResult();
  }


}