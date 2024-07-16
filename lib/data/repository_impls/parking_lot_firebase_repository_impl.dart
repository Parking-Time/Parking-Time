import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:parking_time/common/sortings/distance.dart';
import 'package:parking_time/data/models/api_page_response_model.dart';
import 'package:parking_time/data/models/parking_lot_light_model.dart';
import 'package:parking_time/data/models/parking_lot_model.dart';
import 'package:parking_time/domain/repositories/parking_lot_repository.dart';

import '../../common/sortings/sorting.dart';
import '../../common/typedef/exception_trace.dart';

class ParkingLotFirebaseRepositoryImpl implements ParkingLotRepository {
  static const String _parkingLots = 'parking_lots';
  static const String _amountDayWeeks = 'amount_day_weeks';

  final FirebaseFirestore _firestore;
  
  final GeoFlutterFire _geoFirestore;

  final Map<Sorting, List<Map<String, dynamic>>> _documents = {};

  ParkingLotFirebaseRepositoryImpl({
    required FirebaseFirestore firestore,
    required GeoFlutterFire geoFirestore,
  }) :  _firestore = firestore,
        _geoFirestore = geoFirestore;

  @override
  Future<Either<ExceptionTrace, ParkingLotModel>> getParkingLotDetail({required String id}) async {
    try {
      final parkingLotSnapshot = await _firestore.collection(_parkingLots).doc(id).get();

      final parkingLotJson = parkingLotSnapshot.data()!;

      final amountDayWeekSnapshot = await _firestore.collection(_amountDayWeeks)
          .where('parking_lot', isEqualTo: parkingLotSnapshot.reference).get();

      if (amountDayWeekSnapshot.size > 0) {
        parkingLotJson['amount_day_weeks'] = amountDayWeekSnapshot.docs.first.data();
      }

      // todo [20240714] image 필드 추가 로직 구현 필요

      return Right(ParkingLotModel.fromJson(parkingLotJson));
    } on Exception catch (e, trace) {
      return Left((exception: e, trace: trace));
    }
  }


  // Firebase에서 distance ordering은 page, pageSize값을 무시함
  @override
  Future<Either<ExceptionTrace, ApiPageResponseModel<ParkingLotLightModel>>> getParkingLots({required int page, required int pageSize, required Sorting sorting}) async {
    switch (sorting) {
      case Distance _: {
        final parkingLotSnapshots = _geoFirestore.collection(collectionRef: _firestore.collection(_parkingLots)).withinAsSingleStreamSubscription(
          center: sorting.center,
          radius: sorting.radius,
          field: 'location.geopoint',
        );

        await for (var parkingLotSnapshot in parkingLotSnapshots) {
          final jsonList = parkingLotSnapshot.fold<List<Map<String, dynamic>>>([], (previous, element) {
            if (element.exists) previous.add(element.data() as Map<String, dynamic>);
            return previous;
          });

          _documents[sorting] = jsonList;
        }

        // todo [20240715] image 추가 로직 구현 필요

        if (_documents[sorting] == null) return Left((exception: Exception('parking lot list is empty'), trace: StackTrace.empty));

        final cacheSnapshots = _documents[sorting]!;

        return Right(ApiPageResponseModel(
          data: List.generate(cacheSnapshots.length, (index) => ParkingLotLightModel.fromJson(cacheSnapshots[index])),
          page: 1,
          count: cacheSnapshots.length,
        ));
      }
      default: return Left((exception: Exception('is not supported type'), trace: StackTrace.empty));
    }
  }

}