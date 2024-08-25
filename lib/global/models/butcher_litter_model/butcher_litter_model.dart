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
    dynamic preWeight,
    dynamic weight,
    dynamic price,
  })  : _butcherType = butcherType,
        _date = date,
        _preWeight = preWeight,
        _weight = weight,
        _price = price;

  factory ButcherLitterModel.fromJsonStr(String str) =>
      ButcherLitterModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ButcherLitterModel.fromJson(Map<String, dynamic> json) =>
      _$ButcherLitterModelFromJson(json);

  final bool? _butcherType;
  final DateTime? _date;
  final dynamic _preWeight;
  final dynamic _weight;
  final dynamic _price;

  ButcherLitterModel copyWith({
    bool? Function()? butcherType,
    DateTime? Function()? date,
    dynamic Function()? preWeight,
    dynamic Function()? weight,
    dynamic Function()? price,
  }) {
    return ButcherLitterModel(
      butcherType: butcherType != null ? butcherType() : _butcherType,
      date: date != null ? date() : _date,
      preWeight: preWeight != null ? preWeight() : _preWeight,
      weight: weight != null ? weight() : _weight,
      price: price != null ? price() : _price,
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
    return _date ?? (throw Exception("Date can't be empty"));
  }

  @JsonKey(toJson: valueToJson)
  dynamic get price {
    return _price ?? (throw Exception("Prices can't be empty"));
  }

  @JsonKey(toJson: valueToJson)
  dynamic get preWeight {
    return _preWeight ?? (throw Exception("Preweight can't be empty"));
  }

  @JsonKey(toJson: valueToJson)
  dynamic get weight {
    return _weight ?? (throw Exception("Weight can't be empty"));
  }

  static String valueToJson(dynamic value) {
    if (value is double) {
      return value.toString();
    } else if (value is Map<String, double>) {
      return jsonEncode(value);
    }

    throw "value type is not supported";
  }
}
