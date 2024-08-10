import 'package:json_annotation/json_annotation.dart';

class LimitBoolConverter implements JsonConverter<bool, String> {
  const LimitBoolConverter();

  @override
  bool fromJson(String json) {
    return json == 'unlimited';
  }

  @override
  String toJson(bool object) => object ? 'unlimited' : 'growth';
}
