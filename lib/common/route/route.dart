import 'package:parking_time/common/route/route_name.dart';
import 'package:parking_time/domain/entities/parking_lot/create_parking_lot_entity.dart';
import 'package:parking_time/domain/entities/parking_lot/edit_parking_lot_entity.dart';

abstract class AppRoute {
  String get routingName;
}

class HomeRoute extends AppRoute {
  @override
  String get routingName => AppRouteName.home.name;
}

class CreateParkingLotRoute extends AppRoute {
  CreateParkingLotRoute({required this.entity});
  final CreateParkingLotEntity entity;

  @override
  String get routingName => AppRouteName.create.name;

}

class UpdateParkingLotRoute extends AppRoute {
  UpdateParkingLotRoute({required this.entity});
  final UpdateParkingLotEntity entity;

  @override
  String get routingName => '/parking-lot/${entity.id}/update';
}