import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_time/utils/sortings/sorting.dart';

class Distance implements Sorting {
  @override
  String get name => 'distance';

  @override
  String get argument => '--$name';
}