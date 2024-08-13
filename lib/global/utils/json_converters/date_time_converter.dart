import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String?> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String? json) {
    if (json == null) {
      throw ArgumentError('Cannot parse null date');
    }
    final formats = [
      DateFormat('yyyy-MM-dd'),
      DateFormat('MM/dd/yyyy'),
    ];
    for (final format in formats) {
      try {
        return format.parse(json);
      } catch (e) {
        // Ignore and try the next format
      }
    }
    throw FormatException('Unable to parse date: $json');
  }

  @override
  String? toJson(DateTime object) {
    return DateFormat('MM/dd/yyyy').format(object);
  }
}
