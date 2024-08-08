import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ImageModel {
  final int id;

  final String createdAt;

  final String imageUrl;

  final bool isMainImage;

  final int parkingLot;

  ImageModel({
    required this.id,
    required this.createdAt,
    required this.imageUrl,
    required this.isMainImage,
    required this.parkingLot,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

}