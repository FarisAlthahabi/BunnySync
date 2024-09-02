import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/bool_on_off_converter.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'weight_post_model.g.dart';

@JsonSerializable()
@immutable
class WeightPostModel {
  const WeightPostModel({
    bool? weightType,
    DateTime? date,
    Map<String, double>? weights,
    double? weight,
  })  : _weightType = weightType,
        _date = date,
        _weights = weights,
        _weight = weight;

  factory WeightPostModel.fromJsonStr(String str) =>
      WeightPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory WeightPostModel.fromJson(Map<String, dynamic> json) =>
      _$WeightPostModelFromJson(json);

  final bool? _weightType;
  final DateTime? _date;
  final Map<String, double>? _weights;
  final double? _weight;

  WeightPostModel copyWith({
    bool? Function()? weightType,
    DateTime? Function()? date,
    Map<String, double> Function()? weights,
    double? Function()? weight,
  }) {
    return WeightPostModel(
      weightType: weightType != null ? weightType() : _weightType,
      date: date != null ? date() : _date,
      weights: weights != null ? weights() : _weights,
      weight: weight != null ? weight() : _weight,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$WeightPostModelToJson(this);

  @BoolOnOffConverter()
  @JsonKey(name: 'typeWeigh')
  bool get weightType {
    return _weightType ?? true;
  }

  @DateTimeConverter()
  DateTime get date {
    return _date ?? (throw "Date can't be empty");
  }

  @JsonKey(toJson: weightsToJson)
  Map<String, double>? get weights {
    if (!weightType) {
      return null;
    }
    return _weights ?? (throw "Weights can't be empty");
  }

  double? get weight {
    if (weightType) {
      return null;
    }
    return _weight ?? (throw "Weight can't be empty");
  }

  static String weightsToJson(dynamic value) {
    return jsonEncode(value);
  }
}
