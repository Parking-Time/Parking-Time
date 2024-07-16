import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:parking_time/common/sortings/distance.dart';
import 'package:parking_time/data/repository_impls/parking_lot_firebase_repository_impl.dart';
import 'package:parking_time/domain/use_cases/location_use_case.dart';
import 'package:parking_time/domain/use_cases/parking_lot_use_case.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/typedef/page.dart';
import '../../../domain/entities/parking_lot/parking_lot_light_entity.dart';
import '../../../domain/use_cases/permission_use_case.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) => HomeStateNotifier(
  parkingLotUseCase: ParkingLotUseCase(
    repository: ParkingLotFirebaseRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      geoFirestore: GeoFlutterFire(),
    ),
  ),
  permissionUseCase: PermissionUseCase(),
  locationUseCase: LocationUseCase(),
));


class HomeState {
  AsyncValue<Page<ParkingLotLightEntity>> nearbyParkingLotList = const AsyncValue.loading();
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier({
    required ParkingLotUseCase parkingLotUseCase,
    required PermissionUseCase permissionUseCase,
    required LocationUseCase locationUseCase,
  }) :  _locationUseCase = locationUseCase,
        _permissionUseCase = permissionUseCase,
        _parkingLotUseCase = parkingLotUseCase,
        super(HomeState()) {
    loadNearbyParkingLot();
  }

  final ParkingLotUseCase _parkingLotUseCase;

  final PermissionUseCase _permissionUseCase;

  final LocationUseCase _locationUseCase;

  void requestLocationPermission() {
    _permissionUseCase.requestPermission(Permission.location);
  }
  
  void loadNearbyParkingLot() async {
    if (!await _permissionUseCase.requestPermission(Permission.location).isGranted) return;

    final center = await _locationUseCase.getCurrentLocation();

    final result = await _parkingLotUseCase.getParkingLots(sorting: Distance(center: GeoFirePoint(center.latitude, center.longitude), radius: 2000));

    if (result.isLeft) {
      state.nearbyParkingLotList = AsyncValue.error(result.left.exception, result.left.trace);
    }
  }
  
}
