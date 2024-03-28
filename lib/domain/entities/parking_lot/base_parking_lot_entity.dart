abstract class BaseParkingLotEntity {

  final String name;

  final String address;

  final DateTime parkingTime;

  final List<String> images;

  const BaseParkingLotEntity({
    required this.name,
    required this.address,
    required this.parkingTime,
    required this.images,
  });
}