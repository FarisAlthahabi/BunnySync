import 'dart:convert';

import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/constant_models.dart';
import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/order_model/order_model.dart';
import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/search_entry_model/search_entry_model.dart';
import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/search_model/search_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'search_breeder_request_model.g.dart';

@JsonSerializable()
@immutable
class SearchBreederRequestModel {
  const SearchBreederRequestModel({
    this.draw = 1,
    required this.searchEntry,
    this.order = orders,
    this.start = "0",
    this.length = "10",
    this.searchModel = constSearchModel,
  });
  factory SearchBreederRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchBreederRequestModelFromJson(json);

  factory SearchBreederRequestModel.fromJsonStr(String str) =>
      SearchBreederRequestModel.fromJson(
        jsonDecode(str) as Map<String, dynamic>,
      );

  @JsonKey(defaultValue: 1)
  final int draw;

  @JsonKey(name: 'columns')
  final List<SearchEntryModel> searchEntry;

  final List<OrderModel> order;

  @JsonKey(defaultValue: '0')
  final String start;

  @JsonKey(defaultValue: '10')
  final String length;

  final SearchModel searchModel;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SearchBreederRequestModelToJson(this);
}
