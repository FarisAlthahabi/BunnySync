import 'dart:convert';

import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/search_model/search_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'search_entry_model.g.dart';

@JsonSerializable()
@immutable
class SearchEntryModel {
  const SearchEntryModel({
    this.data = "name",
    this.name = "Nux",
    this.searchable = "true",
    this.orderable = "true",
    required this.search,
  });

  factory SearchEntryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchEntryModelFromJson(json);

  factory SearchEntryModel.fromJsonStr(String str) =>
      SearchEntryModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  @JsonKey(defaultValue: "name")
  final String data;

  @JsonKey(defaultValue: "Nux")
  final String name;

  @JsonKey(defaultValue: "true")
  final String searchable;

  @JsonKey(defaultValue: "true")
  final String orderable;

  final SearchModel search;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SearchEntryModelToJson(this);

  static List<Map<String, dynamic>> toJsonList(List<SearchEntryModel> list) {
    final List<Map<String, dynamic>> result = [];
    for (final item in list) {
      result.add(item.toJson());
    }
    return result;
  }
}
