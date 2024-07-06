// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_breeder_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBreederRequestModel _$SearchBreederRequestModelFromJson(
        Map<String, dynamic> json) =>
    SearchBreederRequestModel(
      draw: (json['draw'] as num?)?.toInt() ?? 1,
      searchEntry: (json['columns'] as List<dynamic>)
          .map((e) => SearchEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: (json['order'] as List<dynamic>?)
              ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          orders,
      start: json['start'] as String? ?? '0',
      length: json['length'] as String? ?? '10',
      searchModel: json['searchModel'] == null
          ? constSearchModel
          : SearchModel.fromJson(json['searchModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchBreederRequestModelToJson(
        SearchBreederRequestModel instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'columns': instance.searchEntry,
      'order': instance.order,
      'start': instance.start,
      'length': instance.length,
      'searchModel': instance.searchModel,
    };
