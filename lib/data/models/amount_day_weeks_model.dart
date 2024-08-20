import 'package:json_annotation/json_annotation.dart';

part 'amount_day_weeks_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AmountDayWeeksModel {
  final AmountDayModel mon;

  final AmountDayModel tue;

  final AmountDayModel thu;

  final AmountDayModel wed;

  final AmountDayModel fri;

  final AmountDayModel sat;

  final AmountDayModel sun;

  final int parkingLot;

  AmountDayWeeksModel({
    required this.mon,
    required this.tue,
    required this.thu,
    required this.wed,
    required this.fri,
    required this.sat,
    required this.sun,
    required this.parkingLot,
  });

  factory AmountDayWeeksModel.fromJson(Map<String, dynamic> json) => _$AmountDayWeeksModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmountDayWeeksModelToJson(this);
}


@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AmountDayModel {
  final int basicAmount;

  final int freeTime;

  final int stackAmount;

  final int stackTime;

  AmountDayModel({
    required this.basicAmount,
    required this.freeTime,
    required this.stackAmount,
    required this.stackTime,
  });

  factory AmountDayModel.fromJson(Map<String, dynamic> json) => _$AmountDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmountDayModelToJson(this);
}
