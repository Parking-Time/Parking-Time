// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:either_dart/either.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:parking_time/data/models/api_page_response_model.dart';
// import 'package:parking_time/data/models/light_parking_lot_model.dart';
// import 'package:parking_time/data/models/parking_lot_model.dart';
// import 'package:parking_time/utils/extensions/query_extensions.dart';
//
// import '../../domain/use_cases/location_use_case.dart';
// import '../../utils/sortings/distance.dart';
// import '../../utils/sortings/sorting.dart';
// import '../../utils/typedef/exception_trace.dart';
// import 'package:parking_time/domain/repositories/parking_lot_repository.dart';
//
// class ParkingLotFirebaseRepositoryImpl implements ParkingLotRepository {
//   static const String _parkingLots = 'parking_lots';
//   static const String _amountDayWeeks = 'amount_day_weeks';
//   static const String _parkingLotImages = 'parking_lot_images';
//
//   final FirebaseFirestore _firestore;
//
//   final Map<Distance, List<LightParkingLotModel>> cacheDistanceSnapshot = {};
//
//   ParkingLotFirebaseRepositoryImpl({
//     required FirebaseFirestore firestore,
//   }) :  _firestore = firestore;
//
//   @override
//   Future<Either<ExceptionTrace, ParkingLotModel>> getParkingLotDetail({required String id}) async {
//     try {
//       final parkingLotSnapshot = await _firestore.collection(_parkingLots).doc(id).get();
//
//       final parkingLotJson = parkingLotSnapshot.data()!;
//
//       final amountDayWeekSnapshot = await _firestore.collection(_amountDayWeeks)
//           .where('parking_lot', isEqualTo: parkingLotSnapshot.reference).get();
//
//       if (amountDayWeekSnapshot.size > 0) {
//         final amountDayWeeksJson = amountDayWeekSnapshot.docs.first.data();
//         amountDayWeeksJson['parking_lot'] = parkingLotSnapshot.reference.id;
//         parkingLotJson['amount_day_weeks'] = amountDayWeeksJson;
//       }
//
//       final images = await _firestore.collection(_parkingLotImages)
//           .where('parking_lot', isEqualTo: parkingLotSnapshot.reference)
//           .get();
//
//       if (images.docs.isNotEmpty) {
//         parkingLotJson['images'] = [images.docs.first.data()['image_url']];
//       }
//
//       return Right(ParkingLotModel.fromJson(parkingLotJson));
//     } on Exception catch (e, trace) {
//       return Left((exception: e, trace: trace));
//     }
//   }
//
//   @override
//   Future<Either<ExceptionTrace, ApiPageResponseModel<LightParkingLotModel>>> getParkingLots({
//     required int page,
//     required int pageSize,
//     LatLng? center,
//     double? radius,
//     required Sorting sorting,
//   }) async {
//     int startAt = (page-1) * pageSize;
//     int endAt = startAt + pageSize;
//
//     Query<Map<String, dynamic>> snapshots = _firestore.collection(_parkingLots);
//
//     if (center != null) {
//       // todo [20240717] domain 바운더리 (고수준 정책) > data 바운더리 (저수준 정책) 침해 - 서버로 repository 구현하면 영역 계산 로직이 넘어가 해결되기에 일단 skip
//       final area = ProviderContainer().read(locationUseCase).getExpandLatLngBoundsWithMeters(center, radius ?? 10000);
//       snapshots = snapshots.whereInArea(latitudeField: 'location.latitude', longitudeField: 'location.longitude', area: area);
//     }
//
//
//     switch (sorting) {
//       case Distance _: {
//         if (cacheDistanceSnapshot[sorting] == null) {
//           final parkingLotSnapshots = (await snapshots.get()).docs;
//
//           final List<LightParkingLotModel> data = [];
//
//           for (var snapshot in parkingLotSnapshots) {
//             final json = snapshot.data();
//             json['id'] = snapshot.reference.id;
//
//             final amountDayWeeks = await _firestore.collection(_amountDayWeeks)
//                 .where('parking_lot', isEqualTo: snapshot.reference)
//                 .get();
//
//             if (amountDayWeeks.docs.isNotEmpty) {
//               final amountDayWeeksJson = amountDayWeeks.docs.first.data();
//               amountDayWeeksJson['parking_lot'] = snapshot.reference.id;
//               json['amount_day_weeks'] = amountDayWeeksJson;
//             }
//
//             final images = await _firestore.collection(_parkingLotImages)
//                 .where('parking_lot', isEqualTo: snapshot.reference)
//                 .where('is_main_image', isEqualTo: true)
//                 .get();
//
//             if (images.docs.isNotEmpty) {
//               json['images'] = [images.docs.first.data()['image_url']];
//             }
//
//             data.add(LightParkingLotModel.fromJson(json));
//           }
//
//           data.sort((a, b) {
//             final distanceA = Geolocator.distanceBetween(sorting.center.latitude, sorting.center.longitude, a.location.latitude, a.location.longitude);
//             final distanceB = Geolocator.distanceBetween(sorting.center.latitude, sorting.center.longitude, b.location.latitude, b.location.longitude);
//             return distanceA.compareTo(distanceB);
//           });
//           cacheDistanceSnapshot[sorting] = data;
//         }
//
//         final data = cacheDistanceSnapshot[sorting] ?? [];
//         if (startAt >= data.length) {
//           return Right(ApiPageResponseModel(data: [], page: page, count: data.length));
//         }
//
//         endAt = endAt > data.length ? data.length : endAt;
//
//         return Right(ApiPageResponseModel(
//           data: data.sublist(startAt, endAt),
//           page: page,
//           count: data.length,
//         ));
//       }
//       default: return Left((exception: Exception('is not supported type'), trace: StackTrace.empty));
//     }
//   }
//
// }