import 'package:json_annotation/json_annotation.dart';

class BoolOnOffConverter implements JsonConverter<bool, String> {
  const BoolOnOffConverter();

  @override
  bool fromJson(String json) => json == 'on';

  @override
  String toJson(bool object) => object ? 'on' : 'off';
}
