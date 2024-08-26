import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/bool_on_off_converter.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'save_sell_litter_model.g.dart';

@JsonSerializable()
@immutable
class SaveSellLitterModel {
  const SaveSellLitterModel({
    bool? sellType = true,
    DateTime? date,
    int? customerId,
    dynamic prices,
  })  : _sellType = sellType,
        _date = date,
        _customerId = customerId,
        _prices = prices;

  factory SaveSellLitterModel.fromJsonStr(String str) =>
      SaveSellLitterModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SaveSellLitterModel.fromJson(Map<String, dynamic> json) =>
      _$SaveSellLitterModelFromJson(json);

  final bool? _sellType;
  final DateTime? _date;
  final int? _customerId;
  final dynamic _prices;

  SaveSellLitterModel copyWith({
    bool? Function()? sellType,
    DateTime? Function()? date,
    int? Function()? customerId,
    dynamic Function()? prices,
  }) {
    return SaveSellLitterModel(
      sellType: sellType != null ? sellType() : _sellType,
      date: date != null ? date() : _date,
      customerId: customerId != null ? customerId() : _customerId,
      prices: prices != null ? prices() : _prices,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SaveSellLitterModelToJson(this);

  @BoolOnOffConverter()
  @JsonKey(name: 'typeBuy')
  bool get sellType {
    return _sellType ?? true;
  }

  @DateTimeConverter()
  DateTime get date {
    return _date ?? (throw Exception("Date can't be empty"));
  }

  @JsonKey(name: 'customer')
  int get customerId {
    return _customerId ?? (throw Exception("Customer can't be empty"));
  }

  @JsonKey(toJson: pricesToJson)
  dynamic get prices {
    return _prices ?? (throw Exception("Prices can't be empty"));
  }

  static String pricesToJson(dynamic value) {
    if (value is double) {
      return value.toString();
    } else if (value is Map<String, double>) {
      return jsonEncode(value);
    }

    throw "value type is not supported";
  }
}
