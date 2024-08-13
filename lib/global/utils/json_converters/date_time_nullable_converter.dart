import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeNullableConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeNullableConverter();

  @override
  DateTime? fromJson(String? json) {
    final formats = [
      DateFormat('yyyy-MM-dd'),
      DateFormat('MM/dd/yyyy'),
    ];
    for (final format in formats) {
      try {
        final result = format.parse(json ?? '');
        return result;
      } catch (e) {
        // Ignore and try the next format
      }
    }
    return null;
  }

  @override
  String? toJson(DateTime? object) {
    if (object != null) {
      return DateFormat('MM/dd/yyyy').format(object);
    }

    return '';
  }
}
