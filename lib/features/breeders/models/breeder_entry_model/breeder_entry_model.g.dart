// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederEntryModel _$BreederEntryModelFromJson(Map<String, dynamic> json) =>
    BreederEntryModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      gender: $enumDecode(_$GenderTypesEnumMap, json['gender']),
      weight: json['weight'] as String?,
      litters: const StringConverter().fromJson(json['litters']),
      kits: const StringConverter().fromJson(json['kits']),
      age: json['age'] as String?,
      status: json['status'] as String?,
      photo: json['photo'] as String?,
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
      prefix: json['prefix'] as String?,
      cage: json['cage'] as String?,
      color: json['color'] as String?,
      tatto: json['tatto'] as String?,
      breed: json['breed'] as String?,
      categoryBreederId: (json['category_breeder_id'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$BreederEntryModelToJson(BreederEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'uuid': instance.uuid,
      'name': instance.name,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'gender': _$GenderTypesEnumMap[instance.gender]!,
      'prefix': instance.prefix,
      'cage': instance.cage,
      'color': instance.color,
      'tatto': instance.tatto,
      'breed': instance.breed,
      'category_breeder_id': instance.categoryBreederId,
      'weight': instance.weight,
      'litters': _$JsonConverterToJson<dynamic, String>(
          instance.litters, const StringConverter().toJson),
      'kits': _$JsonConverterToJson<dynamic, String>(
          instance.kits, const StringConverter().toJson),
      'age': instance.age,
      'status': instance.status,
      'photo': instance.photo,
      'DT_RowIndex': instance.dtRowIndex,
      'isActive': instance.isActive,
    };

const _$GenderTypesEnumMap = {
  GenderTypes.male: 'male',
  GenderTypes.female: 'female',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
