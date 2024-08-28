// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LedgerModel _$LedgerModelFromJson(Map<String, dynamic> json) => LedgerModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      categoryId: const IntConverter().fromJson(json['category_id']),
      name: json['name'] as String,
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      type: LedgerTypes.fromJson(json['type'] as String),
      status: json['status'] as String?,
      amount: const StringConverter().fromJson(json['amount']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      category: TaskTypes.fromJson(json['category'] as String?),
      notes: json['notes'] as String?,
      breederId: const IntNullableConverter().fromJson(json['breeder_id']),
      litterId: const IntNullableConverter().fromJson(json['litter_id']),
      customerId: const IntNullableConverter().fromJson(json['customer_id']),
      customerName: json['customer'] as String?,
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LedgerModelToJson(LedgerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': const IntConverter().toJson(instance.categoryId),
      'name': instance.name,
      'date': const DateTimeConverter().toJson(instance.date),
      'type': _$LedgerTypesEnumMap[instance.type]!,
      'status': instance.status,
      'amount': const StringConverter().toJson(instance.amount),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'notes': instance.notes,
      'category': _$TaskTypesEnumMap[instance.category]!,
      'breeder_id': const IntNullableConverter().toJson(instance.breederId),
      'litter_id': const IntNullableConverter().toJson(instance.litterId),
      'customer_id': const IntNullableConverter().toJson(instance.customerId),
      'customer': instance.customerName,
      'DT_RowIndex': instance.dtRowIndex,
    };

const _$LedgerTypesEnumMap = {
  LedgerTypes.income: 'income',
  LedgerTypes.expenses: 'expenses',
  LedgerTypes.incomePerBreeder: 'incomePerBreeder',
  LedgerTypes.expensesPerBreeder: 'expensesPerBreeder',
};

const _$TaskTypesEnumMap = {
  TaskTypes.breeder: 'breeder',
  TaskTypes.litter: 'litter',
  TaskTypes.general: 'general',
};
