// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_breeder_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBreederRequestModel _$SearchBreederRequestModelFromJson(
        Map<String, dynamic> json) =>
    SearchBreederRequestModel(
      searchEntry: (json['columns'] as List<dynamic>)
          .map((e) => SearchEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchModel:
          SearchModel.fromJson(json['searchModel'] as Map<String, dynamic>),
      draw: (json['draw'] as num?)?.toInt() ?? 1,
      order: (json['order'] as List<dynamic>?)
              ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          orders,
      start: json['start'] as String? ?? '0',
      length: json['length'] as String? ?? '10',
    );

Map<String, dynamic> _$SearchBreederRequestModelToJson(
        SearchBreederRequestModel instance) =>
    <String, dynamic>{
      'columns': SearchEntryModel.toJsonList(instance.searchEntry),
      'searchModel': instance.searchModel.toJson(),
      'draw': instance.draw,
      'order': OrderModel.toJsonList(instance.order),
      'start': instance.start,
      'length': instance.length,
    };
