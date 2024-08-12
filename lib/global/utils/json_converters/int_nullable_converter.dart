import 'package:json_annotation/json_annotation.dart';

class IntNullableConverter implements JsonConverter<int?, dynamic> {
  const IntNullableConverter();

  @override
  int? fromJson(dynamic json) => int.parse(json.toString());

  @override
  dynamic toJson(int? object) => object;
}
