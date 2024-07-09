// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchEntryModel _$SearchEntryModelFromJson(Map<String, dynamic> json) =>
    SearchEntryModel(
      search: SearchModel.fromJson(json['search'] as Map<String, dynamic>),
      data: json['data'] as String? ?? 'name',
      name: json['name'] as String? ?? 'Nux',
      searchable: json['searchable'] as String? ?? 'true',
      orderable: json['orderable'] as String? ?? 'true',
    );

Map<String, dynamic> _$SearchEntryModelToJson(SearchEntryModel instance) =>
    <String, dynamic>{
      'search': instance.search.toJson(),
      'data': instance.data,
      'name': instance.name,
      'searchable': instance.searchable,
      'orderable': instance.orderable,
    };
