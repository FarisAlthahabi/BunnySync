import 'dart:convert';

import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeder_pair_model.g.dart';

@JsonSerializable()
@immutable
class BreederPairModel implements DropDownItemModel {
  const BreederPairModel({
    required this.id,
    required this.userId,
    required this.femaleBreederId,
    required this.maleBreederId,
    required this.type,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.maleBreeder,
    required this.femaleBreeder,
  });

  factory BreederPairModel.fromJsonStr(String str) =>
      BreederPairModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederPairModel.fromJson(Map<String, dynamic> json) =>
      _$BreederPairModelFromJson(json);

  @override
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'female_id')
  final int femaleBreederId;

  @JsonKey(name: 'male_id')
  final int maleBreederId;

  final String type;

  @DateTimeConverter()
  final DateTime date;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'male')
  final BreederEntryModel? maleBreeder;

  @JsonKey(name: 'female')
  final BreederEntryModel? femaleBreeder;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederPairModelToJson(this);

  @override
  String get displayName =>
      '${date.formatMMddYYYY}-${maleBreeder?.displayName ?? 'unknown'.i18n} & ${femaleBreeder?.displayName}';
}
