// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSignUpModel _$PostSignUpModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['confirm_password'],
  );
  return PostSignUpModel(
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    confirmPassword: json['confirm_password'] as String?,
  );
}

Map<String, dynamic> _$PostSignUpModelToJson(PostSignUpModel instance) =>
    <String, dynamic>{
      'confirm_password': instance.confirmPassword,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
