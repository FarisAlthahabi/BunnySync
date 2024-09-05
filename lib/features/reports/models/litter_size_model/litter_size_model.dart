import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/double_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'litter_size_model.g.dart';

@JsonSerializable()
@immutable
class LitterSizeModel{
  const LitterSizeModel({
    required this.breeders,
    required this.avgKits,
  });

  factory LitterSizeModel.fromJsonStr(String str) =>
      LitterSizeModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LitterSizeModel.fromJson(Map<String, dynamic> json) =>
      _$LitterSizeModelFromJson(json);

  @JsonKey(name: 'breeder')
  final List<String> breeders;

  @DoubleConverter()
  final List<double> avgKits;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LitterSizeModelToJson(this);

  static String get path => 'litter-size';
}
