// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'log_out_model.g.dart';

@JsonSerializable()
@CopyWith(skipFields: true)
@immutable
class LogOutModel {

  const LogOutModel({
    this.data,
  });

  factory LogOutModel.fromJsonStr(String str) =>
      LogOutModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LogOutModel.fromJson(Map<String, dynamic> json) =>
      _$LogOutModelFromJson(json);

      String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LogOutModelToJson(this);
  


  @JsonKey(name : 'data')
  final List<dynamic>? data;




}
