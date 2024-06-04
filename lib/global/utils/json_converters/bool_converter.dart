import 'package:json_annotation/json_annotation.dart';

class BoolConverter implements JsonConverter<bool, String> {
  const BoolConverter();

  @override
  bool fromJson(String json) => int.parse(json) == 1;

  @override
  String toJson(bool object) => object ? '1' : '0';
}
