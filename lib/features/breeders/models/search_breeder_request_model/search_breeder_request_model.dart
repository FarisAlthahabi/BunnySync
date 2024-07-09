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
    required this.searchEntry,
    this.searchModel = constSearchModel,
    this.draw = 1,
    this.order = orders,
    this.start = "0",
    this.length = "10",
  });
  factory SearchBreederRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchBreederRequestModelFromJson(json);

  factory SearchBreederRequestModel.fromJsonStr(String str) =>
      SearchBreederRequestModel.fromJson(
        jsonDecode(str) as Map<String, dynamic>,
      );

  @JsonKey(name: 'columns', toJson: SearchEntryModel.toJsonList)
  final List<SearchEntryModel> searchEntry;

  final SearchModel searchModel;

  @JsonKey(defaultValue: 1)
  final int draw;

  @JsonKey(toJson: OrderModel.toJsonList)
  final List<OrderModel> order;

  @JsonKey(defaultValue: '0')
  final String start;

  @JsonKey(defaultValue: '10')
  final String length;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SearchBreederRequestModelToJson(this);
}
