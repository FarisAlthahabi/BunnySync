// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LedgerPostModel _$LedgerPostModelFromJson(Map<String, dynamic> json) =>
    LedgerPostModel(
      title: json['title'] as String?,
      amount: json['amount'] as num?,
      type: $enumDecodeNullable(_$LedgerTypesEnumMap, json['type']),
      taskType: $enumDecodeNullable(_$TaskTypesEnumMap, json['taskType']),
      who: (json['who'] as num?)?.toInt(),
      customerId: (json['customer'] as num?)?.toInt(),
      categoryId: (json['category'] as num?)?.toInt(),
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      note: json['note'] as String?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$LedgerPostModelToJson(LedgerPostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'amount': instance.amount,
      'type': _$LedgerTypesEnumMap[instance.type]!,
      'category': instance.categoryId,
      'taskType': _$TaskTypesEnumMap[instance.taskType],
      'who': instance.who,
      'customer': instance.customerId,
      'date': const DateTimeConverter().toJson(instance.date),
      'note': instance.note,
      'file': instance.file,
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
