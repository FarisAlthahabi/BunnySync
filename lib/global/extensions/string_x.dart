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
}
