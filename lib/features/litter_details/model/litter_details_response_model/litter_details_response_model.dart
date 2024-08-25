import 'dart:convert';

import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_model/litter_details_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'litter_details_response_model.g.dart';

@JsonSerializable()
@immutable
class LitterDetailsResponseModel {
  const LitterDetailsResponseModel({
    required this.litter,
    required this.fosterKits,
    required this.age,
    required this.totalWeight,
    required this.activeLittersCount,
    required this.diedLittersCount,
    required this.survivalRate,
    this.averegeWeight,
  });

  factory LitterDetailsResponseModel.fromJsonStr(String str) =>
      LitterDetailsResponseModel.fromJson(
          jsonDecode(str) as Map<String, dynamic>);

  factory LitterDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LitterDetailsResponseModelFromJson(json);

  final LitterDetailsModel litter;

  final List<KitModel> fosterKits;

  final String age;

  final double totalWeight;

  final double? averegeWeight;

  @JsonKey(name: 'getStatusActive')
  final int activeLittersCount;

  @JsonKey(name: 'getStatusDied')
  final int diedLittersCount;

  final int survivalRate;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LitterDetailsResponseModelToJson(this);

  LitterDetailsResponseModel copyWith({
    LitterDetailsModel? litter,
    List<KitModel>? fosterKits,
    String? age,
    double? totalWeight,
    double? averegeWeight,
    int? activeLittersCount,
    int? diedLittersCount,
    int? survivalRate,
  }) {
    return LitterDetailsResponseModel(
      litter: litter ?? this.litter,
      fosterKits: fosterKits ?? this.fosterKits,
      age: age ?? this.age,
      totalWeight: totalWeight ?? this.totalWeight,
      averegeWeight: averegeWeight ?? this.averegeWeight,
      activeLittersCount: activeLittersCount ?? this.activeLittersCount,
      diedLittersCount: diedLittersCount ?? this.diedLittersCount,
      survivalRate: survivalRate ?? this.survivalRate,
    );
  }
}
