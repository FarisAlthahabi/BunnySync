import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'order_model.g.dart';

@JsonSerializable()
@immutable
class OrderModel {
  const OrderModel({
    required this.column,
    required this.dir,
  });

    factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  factory OrderModel.fromJsonStr(String str) =>
      OrderModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  @JsonKey(defaultValue: "0")
  final String column;

  @JsonKey(defaultValue: "asc")
  final String dir;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
