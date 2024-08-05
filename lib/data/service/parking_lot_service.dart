import 'dart:async';

import 'package:dio/dio.dart';
import 'package:parking_time/data/models/light_parking_lot_model.dart';
import 'package:retrofit/http.dart';

import '../models/api_response_model.dart';

part 'parking_lot_service.g.dart';

@RestApi(baseUrl: '/parking_lots')
abstract class ParkingLotService {
  factory ParkingLotService(Dio dio, {String baseUrl}) = _ParkingLotService;

  @GET('')
  Future<ApiResponseModel<List<LightParkingLotModel>>> getParkingLots({
    @Query('sorting') required String sorting,
    @Query('page') required int page,
    @Query('page_size') int? pageSize,
    @Query('center') required String center,
    @Query('distance') double? distance,
    @Query('keyword') String? keyword,
  });
}