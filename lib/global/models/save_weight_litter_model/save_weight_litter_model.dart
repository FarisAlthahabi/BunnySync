import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/bool_on_off_converter.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'save_weight_litter_model.g.dart';

@JsonSerializable()
@immutable
class SaveWeightLitterModel {
  const SaveWeightLitterModel({
    bool? weightType = true,
    DateTime? date,
    dynamic weights,
  })  : _weightType = weightType,
        _date = date,
        _weights = weights;

  factory SaveWeightLitterModel.fromJsonStr(String str) =>
      SaveWeightLitterModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SaveWeightLitterModel.fromJson(Map<String, dynamic> json) =>
      _$SaveWeightLitterModelFromJson(json);

  final bool? _weightType;
  final DateTime? _date;
  final dynamic _weights;

  SaveWeightLitterModel copyWith({
    bool? Function()? weightType,
    DateTime? Function()? date,
    dynamic Function()? weights,
  }) {
    return SaveWeightLitterModel(
      weightType: weightType != null ? weightType() : _weightType,
      date: date != null ? date() : _date,
      weights: weights != null ? weights() : _weights,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SaveWeightLitterModelToJson(this);

  @BoolOnOffConverter()
  @JsonKey(name: 'typeWeigh')
  bool get weightType {
    return _weightType ?? true;
  }

  @DateTimeConverter()
  DateTime get date {
    return _date ?? (throw Exception("Date can't be empty"));
  }


  @JsonKey(toJson: weightsToJson)
  dynamic get weights {
    return _weights ?? (throw Exception("Weights can't be empty"));
  }

  static String weightsToJson(dynamic value) {
    if (value is double) {
      return value.toString();
    } else if (value is Map<String, double>) {
      return jsonEncode(value);
    }
    throw "value type is not supported";
  }
}
