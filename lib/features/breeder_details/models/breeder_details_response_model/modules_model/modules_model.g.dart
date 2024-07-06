// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modules_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModulesModel _$ModulesModelFromJson(Map<String, dynamic> json) => ModulesModel(
      limit: json['limit'] as String,
      health: json['health'] as bool,
      litter: json['litter'] as bool,
      report: json['report'] as bool,
      breeder: json['breeder'] as bool,
      finance: json['finance'] as bool,
      qrCode: json['qr_code'] as bool,
      pedigree: json['pedigree'] as bool,
      schedule: json['schedule'] as bool,
      cageCard: json['cage_card'] as bool,
      attachment: json['attachment'] as bool,
      marketPlace: json['marketplace'] as bool,
      contactList: json['contact_list'] as bool,
      notification: json['notification'] as bool,
    );

Map<String, dynamic> _$ModulesModelToJson(ModulesModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'health': instance.health,
      'litter': instance.litter,
      'report': instance.report,
      'breeder': instance.breeder,
      'finance': instance.finance,
      'qr_code': instance.qrCode,
      'pedigree': instance.pedigree,
      'schedule': instance.schedule,
      'cage_card': instance.cageCard,
      'attachment': instance.attachment,
      'marketplace': instance.marketPlace,
      'contact_list': instance.contactList,
      'notification': instance.notification,
    };
