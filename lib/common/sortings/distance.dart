import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:parking_time/common/sortings/sorting.dart';

class Distance implements Sorting {
  @override
  String get name => 'distance';

  final GeoFirePoint center;

  final double radius;

  Distance({required this.center, required this.radius});

  @override
  bool equals(Object other) => other is Distance
      && center.longitude == other.center.longitude
      && center.latitude == other.center.longitude;
}