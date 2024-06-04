import 'package:json_annotation/json_annotation.dart';

class IntListConverter implements JsonConverter<List<int>, List<dynamic>> {
  const IntListConverter();

  @override
  List<int> fromJson(List<dynamic> json) =>
      json.map((e) => int.parse(e as String)).toList();

  @override
  List<String> toJson(List<int> object) =>
      object.map((e) => e.toString()).toList();
}
