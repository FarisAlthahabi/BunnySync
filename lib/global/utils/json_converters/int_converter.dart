import 'package:json_annotation/json_annotation.dart';

class IntConverter implements JsonConverter<int, String> {
  const IntConverter();

  @override
  int fromJson(String json) => int.parse(json);

  @override
  String toJson(int object) => object.toString();
}
