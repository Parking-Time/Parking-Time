import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_time/data/repository_impls/parking_lot_firebase_repository_impl.dart';
import 'package:parking_time/data/repository_impls/parking_lot_repository_impl.dart';
import 'package:parking_time/data/service/dio/dio_config.dart';
import 'package:parking_time/data/service/parking_lot_service.dart';
import 'package:parking_time/domain/entities/light_parking_lot/light_parking_lot_entity.dart';

import '../../domain/repositories/parking_lot_repository.dart';
import '../../utils/sortings/sorting.dart';
import '../../utils/typedef/exception_trace.dart';
import '../../utils/typedef/page.dart';

final parkingLotUseCase = Provider((ref) => ParkingLotUseCase(repository: ParkingLotRepositoryImpl(
  parkingLotService: ParkingLotService(DioConfig.instance),
)));

class ParkingLotUseCase {

  final ParkingLotRepository _repository;

  ParkingLotUseCase({required ParkingLotRepository repository}) : _repository = repository;

  Future<Either<ExceptionTrace, Page<LightParkingLotEntity>>> getParkingLots({
    required Sorting sorting,
    int page = 1,
    int pageSize = 10,
    required LatLng center,
    double? radius,
    String? keyword,
  }) async {
    final result = await _repository.getParkingLots(page: page, pageSize: pageSize, sorting: sorting, center: center, radius: radius, keyword: keyword);
    if (result.isLeft) return Left(result.left);

    final parkingLotEntityList = List.generate(result.right.data.length, (index) => LightParkingLotEntity.fromModel(result.right.data[index]));
    return Right((data: parkingLotEntityList, page: result.right.page, pageSize: pageSize, count: result.right.count));
  }

}