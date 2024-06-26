// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSignUpModel _$PostSignUpModelFromJson(Map<String, dynamic> json) =>
    PostSignUpModel(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$PostSignUpModelToJson(PostSignUpModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
