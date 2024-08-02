import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateParser implements JsonConverter<DateTime, String?> {
  const DateParser();

  @override
  DateTime fromJson(String? json) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return DateFormat('dd/MM/yyyy').parse(json ?? formattedDate);
  }
  
  @override
  String toJson(DateTime object) {
    return DateFormat('MM/dd/yyyy').format(object);
  }
}
