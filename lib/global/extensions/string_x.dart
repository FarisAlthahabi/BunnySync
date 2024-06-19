import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

extension StringX on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get notNullOrEmpty => this != null && this!.isNotEmpty;
}

extension StringX2 on String {
  String get capitalizeFirstLetter => '${this[0].toUpperCase()}${substring(1)}';

  String get titleToCamel {
    final result = replaceAllMapped(
      RegExp(r'(?<!^)\s+(.)'),
      (Match m) => m.group(1)?.toUpperCase() ?? this,
    );

    return result[0].toLowerCase() + result.substring(1);
  }

  Widget svg({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        this,
        width: width,
        height: height,
        //TODO
        color: color,
      );

  Color get color => Color(int.parse('0xff${trim()}'));
}
