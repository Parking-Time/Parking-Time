import 'package:parking_time/data/models/image_model.dart';

class ImageEntity {
  final int id;

  final DateTime createdAt;

  final String imageUrl;

  final bool isMainImage;

  final int parkingLot;

  ImageEntity({
    required this.id,
    required this.createdAt,
    required this.imageUrl,
    required this.isMainImage,
    required this.parkingLot,
  });

  factory ImageEntity.fromModel(ImageModel model) => ImageEntity(
    id: model.id,
    createdAt: DateTime.parse(model.createdAt),
    imageUrl: model.imageUrl,
    isMainImage: model.isMainImage,
    parkingLot: model.parkingLot,
  );
}