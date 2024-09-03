import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/bool_on_off_converter.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'butcher_litter_model.g.dart';

@JsonSerializable()
@immutable
class ButcherLitterModel {
  const ButcherLitterModel({
    bool? butcherType = true,
    DateTime? date,
    double? preWeight,
    double? weight,
    double? price,
    Map<String, dynamic>? preWeights,
    Map<String, dynamic>? weights,
    Map<String, dynamic>? prices,
  })  : _butcherType = butcherType,
        _date = date,
        _preWeight = preWeight,
        _weight = weight,
        _price = price,
        _preWeights = preWeights,
        _weights = weights,
        _prices = prices;

  factory ButcherLitterModel.fromJsonStr(String str) =>
      ButcherLitterModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ButcherLitterModel.fromJson(Map<String, dynamic> json) =>
      _$ButcherLitterModelFromJson(json);

  final bool? _butcherType;
  final DateTime? _date;
  final double? _preWeight;
  final double? _weight;
  final double? _price;
  final Map<String, dynamic>? _preWeights;
  final Map<String, dynamic>? _weights;
  final Map<String, dynamic>? _prices;

  ButcherLitterModel copyWith({
    bool? Function()? butcherType,
    DateTime? Function()? date,
    double? Function()? preWeight,
    double? Function()? weight,
    double? Function()? price,
    Map<String, dynamic>? Function()? preWeights,
    Map<String, dynamic>? Function()? weights,
    Map<String, dynamic>? Function()? prices,
  }) {
    return ButcherLitterModel(
      butcherType: butcherType != null ? butcherType() : _butcherType,
      date: date != null ? date() : _date,
      preWeight: preWeight != null ? preWeight() : _preWeight,
      weight: weight != null ? weight() : _weight,
      price: price != null ? price() : _price,
      preWeights: preWeights != null ? preWeights() : _preWeights,
      weights: weights != null ? weights() : _weights,
      prices: prices != null ? prices() : _prices,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$ButcherLitterModelToJson(this);

  @BoolOnOffConverter()
  @JsonKey(name: 'typeButcher')
  bool get butcherType {
    return _butcherType ?? true;
  }

  @DateTimeConverter()
  DateTime get date {
    return _date ?? (throw "Date can't be empty");
  }

  double? get price {
    if (butcherType) {
      return null;
    }
    return _price ?? (throw "Prices can't be empty");
  }

  double? get preWeight {
    if (butcherType) {
      return null;
    }
    return _preWeight ?? (throw "Preweight can't be empty");
  }

  double? get weight {
    if (butcherType) {
      return null;
    }
    return _weight ?? (throw "Weight can't be empty");
  }

  Map<String, dynamic>? get prices {
    if (butcherType) {
      return null;
    }
    return _prices ?? (throw "Prices can't be empty");
  }

  Map<String, dynamic>? get preWeights {
    if (butcherType) {
      return null;
    }
    return _preWeights ?? (throw "Preweight can't be empty");
  }

  Map<String, dynamic>? get weights {
    if (butcherType) {
      return null;
    }
    return _weights ?? (throw "Weight can't be empty");
  }
}
