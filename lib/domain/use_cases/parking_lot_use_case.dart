import 'package:either_dart/either.dart';
import 'package:parking_time/domain/entities/parking_lot/parking_lot_light_entity.dart';
import 'package:parking_time/domain/repositories/parking_lot_repository.dart';

import '../../common/sortings/sorting.dart';
import '../../common/typedef/exception_trace.dart';
import '../../common/typedef/page.dart';

class ParkingLotUseCase {

  final ParkingLotRepository repository;

  ParkingLotUseCase({required this.repository});

  Future<Either<ExceptionTrace, Page<ParkingLotLightEntity>>> getParkingLots({required Sorting sorting, int page = 1, int pageSize = 10}) async {
    final result = await repository.getParkingLots(page: page, pageSize: pageSize, sorting: sorting);
    if (result.isLeft) return Left(result.left);

    final parkingLotEntityList = List.generate(result.right.data.length, (index) => ParkingLotLightEntity.fromModel(result.right.data[index]));
    return Right((data: parkingLotEntityList, page: result.right.page, count: result.right.count));
  }

}