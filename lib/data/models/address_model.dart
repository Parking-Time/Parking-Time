import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AddressModel {
  final String sido;

  final String sgg;

  final String umd;

  final String ri;

  final String addressLine;

  AddressModel({
    required this.sido,
    required this.sgg,
    required this.umd,
    required this.ri,
    required this.addressLine,
  });

  factory AddressModel.init() => AddressModel(sido: '', sgg: '', umd: '', ri: '', addressLine: '');

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}