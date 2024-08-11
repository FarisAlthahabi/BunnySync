import 'dart:convert';

import 'package:bunny_sync/features/add_ailment/model/ailment_types/ailment_status_types.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'ailment_post_model.g.dart';

@JsonSerializable()
@immutable
class AilmentPostModel {
  const AilmentPostModel({
    String? type,
    this.breederId,
    this.kitId,
    String? title,
    String? symptoms,
    DateTime? startDate,
    AilmentStatusTypes? status,
    String? note,
  })  : _type = type,
        _title = title,
        _symptoms = symptoms,
        _startDate = startDate,
        _status = status,
        _note = note;

  factory AilmentPostModel.fromJsonStr(String str) =>
      AilmentPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AilmentPostModel.fromJson(Map<String, dynamic> json) =>
      _$AilmentPostModelFromJson(json);

  final String? _type;

  @JsonKey(name: 'breeder')
  final int? breederId;

  @JsonKey(name: 'kits')
  final int? kitId;

  final String? _title;

  final String? _symptoms;

  final DateTime? _startDate;

  final AilmentStatusTypes? _status;

  final String? _note;

  AilmentPostModel copyWith({
    String? Function()? type,
    int? Function()? breederId,
    int? Function()? kitId,
    String? Function()? title,
    String? Function()? symptoms,
    DateTime? Function()? startDate,
    AilmentStatusTypes? Function()? status,
    String? Function()? note,
  }) {
    return AilmentPostModel(
      type: type != null ? type() : _type,
      breederId: breederId != null ? breederId() : this.breederId,
      kitId: kitId != null ? kitId() : this.kitId,
      title: title != null ? title() : _title,
      symptoms: symptoms != null ? symptoms() : _symptoms,
      startDate: startDate != null ? startDate() : _startDate,
      status: status != null ? status() : _status,
      note: note != null ? note() : _note,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AilmentPostModelToJson(this);

  String get type {
    return _type ?? (throw Exception("type can't be null"));
  }

  String get title {
    if (_title == null || _title.isEmpty) {
      throw Exception("Ailments can't be empty");
    } else {
      return _title;
    }
  }

  String get symptoms {
    if (_symptoms == null || _symptoms.isEmpty) {
      throw Exception("Symptoms can't be empty");
    } else {
      return _symptoms;
    }
  }

  @DateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime get startDate {
    if (_startDate == null || _startDate.toString().isEmpty) {
      throw Exception("Start date can't be empty");
    } else {
      return _startDate;
    }
  }

  AilmentStatusTypes get status {
    if (_status == null) {
      throw Exception("Status can't be empty");
    } else {
      return _status;
    }
  }

  String get note {
    if (_note == null || _note.isEmpty) {
      return 'no_note'.i18n;
    } else {
      return _note;
    }
  }
}
