import 'dart:convert';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
@CopyWith(skipFields: true)
@immutable
class SignInModel extends Equatable {
  const SignInModel({
    required this.token,
    required this.name,
    required this.userId,
  });

  factory SignInModel.fromJsonStr(String str) =>
      SignInModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'user_id')
  final int userId;


  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);

  @override
  List<Object?> get props => [token];
}
