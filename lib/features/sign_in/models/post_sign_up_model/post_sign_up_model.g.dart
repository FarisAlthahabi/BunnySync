// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_sign_up_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostSignUpModelCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PostSignUpModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PostSignUpModel call({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostSignUpModel.copyWith(...)`.
class _$PostSignUpModelCWProxyImpl implements _$PostSignUpModelCWProxy {
  const _$PostSignUpModelCWProxyImpl(this._value);

  final PostSignUpModel _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PostSignUpModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PostSignUpModel call({
    Object? fullName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? confirmPassword = const $CopyWithPlaceholder(),
  }) {
    return PostSignUpModel(
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      confirmPassword: confirmPassword == const $CopyWithPlaceholder()
          ? _value.confirmPassword
          // ignore: cast_nullable_to_non_nullable
          : confirmPassword as String?,
    );
  }
}

extension $PostSignUpModelCopyWith on PostSignUpModel {
  /// Returns a callable class that can be used as follows: `instanceOfPostSignUpModel.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$PostSignUpModelCWProxy get copyWith => _$PostSignUpModelCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)`.
  ///
  /// Usage
  /// ```dart
  /// PostSignUpModel(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  PostSignUpModel copyWithNull({
    bool fullName = false,
    bool email = false,
    bool password = false,
    bool confirmPassword = false,
  }) {
    return PostSignUpModel(
      fullName: fullName == true ? null : this.fullName,
      email: email == true ? null : this.email,
      password: password == true ? null : this.password,
      confirmPassword: confirmPassword == true ? null : this.confirmPassword,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSignUpModel _$PostSignUpModelFromJson(Map<String, dynamic> json) =>
    PostSignUpModel(
      fullName: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['c_password'] as String?,
    );

Map<String, dynamic> _$PostSignUpModelToJson(PostSignUpModel instance) =>
    <String, dynamic>{
      'name': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'c_password': instance.confirmPassword,
    };
