// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LedgerModel _$LedgerModelFromJson(Map<String, dynamic> json) => LedgerModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      name: json['name'] as String,
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      type: $enumDecode(_$LedgerTypesEnumMap, json['type']),
      status: json['status'] as String,
      amount: json['amount'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      category: TaskTypes.fromJson(json['category'] as String),
      notes: json['notes'] as String?,
      breederId: (json['breeder_id'] as num?)?.toInt(),
      litterId: (json['litter_id'] as num?)?.toInt(),
      customerId: (json['customer_id'] as num?)?.toInt(),
      customerName: json['customer'] as String?,
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LedgerModelToJson(LedgerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'name': instance.name,
      'date': const DateTimeConverter().toJson(instance.date),
      'type': _$LedgerTypesEnumMap[instance.type]!,
      'status': instance.status,
      'amount': instance.amount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'notes': instance.notes,
      'category': _$TaskTypesEnumMap[instance.category]!,
      'breeder_id': instance.breederId,
      'litter_id': instance.litterId,
      'customer_id': instance.customerId,
      'customer': instance.customerName,
      'DT_RowIndex': instance.dtRowIndex,
    };

const _$LedgerTypesEnumMap = {
  LedgerTypes.income: 'income',
  LedgerTypes.expense: 'expense',
};

const _$TaskTypesEnumMap = {
  TaskTypes.breeder: 'breeder',
  TaskTypes.litter: 'litter',
  TaskTypes.general: 'general',
};
