import 'package:intl/intl.dart';

extension ShowNumAsCurrency on num {
  String showAsCurrency({
    String locale = 'en_US',
    String currencySymbol = '\$',
    int decimalDigits = 2,
    bool isSymbolAtStart = true,
    bool spaceBetween = false,
  }) {
    // Define a custom pattern based on the position of the currency symbol
    String pattern = isSymbolAtStart
        ? '¤${spaceBetween ? ' ' : ''}#,##0.${'0' * decimalDigits}' // ¤ represents the currency symbol
        : '#,##0.${'0' * decimalDigits}${spaceBetween ? ' ' : ''}¤'; // Place symbol at the end

    // Use the customPattern parameter to apply the custom format
    final NumberFormat format = NumberFormat.currency(
      locale: locale,
      symbol: currencySymbol,
      customPattern: pattern,
    );

    return format.format(this);
  }
}

extension ShowintAsCurrency on int {
  String showAsCurrency({
    String locale = 'en_US',
    String currencySymbol = '\$',
    bool isSymbolAtStart = true,
    bool spaceBetween = false,
  }) {
    // Define a custom pattern based on the position of the currency symbol
    String pattern = isSymbolAtStart
        ? '¤${spaceBetween ? ' ' : ''}#,##0' // ¤ represents the currency symbol
        : '#,##0${spaceBetween ? ' ' : ''}¤'; // Place symbol at the end

    // Use the customPattern parameter to apply the custom format
    final NumberFormat format = NumberFormat.currency(
      locale: locale,
      decimalDigits: 0,
      symbol: currencySymbol,
      customPattern: pattern,
    );

    return format.format(this);
  }
}
