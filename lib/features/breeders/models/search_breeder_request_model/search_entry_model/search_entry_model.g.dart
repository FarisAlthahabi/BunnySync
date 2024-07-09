// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchEntryModel _$SearchEntryModelFromJson(Map<String, dynamic> json) =>
    SearchEntryModel(
      data: json['data'] as String? ?? 'name',
      name: json['name'] as String? ?? 'Nux',
      searchable: json['searchable'] as String? ?? 'true',
      orderable: json['orderable'] as String? ?? 'true',
      search: SearchModel.fromJson(json['search'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchEntryModelToJson(SearchEntryModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'name': instance.name,
      'searchable': instance.searchable,
      'orderable': instance.orderable,
      'search': instance.search,
    };
