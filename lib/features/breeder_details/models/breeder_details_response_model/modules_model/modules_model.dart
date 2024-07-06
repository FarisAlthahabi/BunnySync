
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'modules_model.g.dart';

@immutable
@JsonSerializable()
class ModulesModel {
  const ModulesModel({
    required this.limit,
    required this.health,
    required this.litter,
    required this.report,
    required this.breeder,
    required this.finance,
    required this.qrCode,
    required this.pedigree,
    required this.schedule,
    required this.cageCard,
    required this.attachment,
    required this.marketPlace,
    required this.contactList,
    required this.notification,
  });

  factory ModulesModel.fromJsonStr(String str) =>
      ModulesModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ModulesModel.fromJson(Map<String, dynamic> json) =>
      _$ModulesModelFromJson(json);

  final String limit;

  final bool health;

  final bool litter;

  final bool report;

  final bool breeder;

  final bool finance;

  @JsonKey(name: 'qr_code')
  final bool qrCode;

  final bool pedigree;

  final bool schedule;

  @JsonKey(name: 'cage_card')
  final bool cageCard;

  final bool attachment;

  @JsonKey(name: 'marketplace')
  final bool marketPlace;

  @JsonKey(name: 'contact_list')
  final bool contactList;

  final bool notification;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$ModulesModelToJson(this);
}
