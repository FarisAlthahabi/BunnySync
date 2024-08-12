import 'package:json_annotation/json_annotation.dart';

class IntConverter implements JsonConverter<int?, dynamic> {
  const IntConverter();

  @override
  int? fromJson(dynamic json) => int.tryParse(json.toString());

  @override
  dynamic toJson(int? object) => object;
}
