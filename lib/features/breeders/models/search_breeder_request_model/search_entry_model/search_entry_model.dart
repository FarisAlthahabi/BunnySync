import 'dart:convert';

import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/search_model/search_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'search_entry_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class SearchEntryModel {
  const SearchEntryModel({
    required this.search,
    this.data = "name",
    this.name = "Nux",
    this.searchable = "true",
    this.orderable = "true",
  });

  factory SearchEntryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchEntryModelFromJson(json);

  factory SearchEntryModel.fromJsonStr(String str) =>
      SearchEntryModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  final SearchModel search;

  @JsonKey(defaultValue: "name")
  final String data;

  @JsonKey(defaultValue: "Nux")
  final String name;

  @JsonKey(defaultValue: "true")
  final String searchable;

  @JsonKey(defaultValue: "true")
  final String orderable;

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
