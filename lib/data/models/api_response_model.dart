import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake, genericArgumentFactories: true)
class ApiResponseModel<T> {
  final int status;

  final String? errorMessage;

  final T? body;

  final MetaModel? meta;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) => _$ApiResponseModelToJson(this, toJsonT);

  ApiResponseModel({
    required this.status,
    this.errorMessage,
    this.body,
    this.meta,
  });

}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class MetaModel {
  final int page;

  final int pageSize;

  final int count;

  factory MetaModel.fromJson(Map<String, dynamic> json) => _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);

  MetaModel({required this.page, required this.pageSize, required this.count});
}