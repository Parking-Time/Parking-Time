import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/entities/parking_lot/light_parking_lot_entity.dart';
import '../../../domain/use_cases/location_use_case.dart';
import '../../../domain/use_cases/parking_lot_use_case.dart';
import '../../../domain/use_cases/permission_use_case.dart';
import '../../../utils/sortings/distance.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) => HomeStateNotifier(
  parkingLotUseCase: ref.read(parkingLotUseCase),
  permissionUseCase: ref.read(permissionUseCase),
  locationUseCase: ref.read(locationUseCase),
));

class HomeStateNotifier extends StateNotifier<HomeState> {
  final ParkingLotUseCase _parkingLotUseCase;

  final PermissionUseCase _permissionUseCase;

  final LocationUseCase _locationUseCase;

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
  
  void loadNearbyParkingLot() async {
    if (!(await _permissionUseCase.requestPermission(Permission.locationWhenInUse)).isGranted) return;

    const center = LatLng(37.5250243, 126.9258867);
    //final center = await _locationUseCase.getFastUserCurrentLocation();

    final result = await _parkingLotUseCase.getParkingLots(sorting: Distance(), center: center, radius: 10000);

    state = state.copyWith(
      nearbyParkingLotList: result.isLeft
          ? AsyncValue.error(result.left.exception, result.left.trace)
          : AsyncValue.data(result.right.data),
    );

  }
}

class HomeState {
  final AsyncValue<List<LightParkingLotEntity>> nearbyParkingLotList;

  HomeState({this.nearbyParkingLotList = const AsyncValue.loading()});

  HomeState copyWith({AsyncValue<List<LightParkingLotEntity>>? nearbyParkingLotList}) {
    return HomeState(
      nearbyParkingLotList: nearbyParkingLotList ?? this.nearbyParkingLotList,
    );
  }
}