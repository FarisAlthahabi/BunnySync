// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SignInModelCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SignInModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SignInModel call({
    String? token,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignInModel.copyWith(...)`.
class _$SignInModelCWProxyImpl implements _$SignInModelCWProxy {
  const _$SignInModelCWProxyImpl(this._value);

  final SignInModel _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SignInModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SignInModel call({
    Object? token = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return SignInModel(
      token: token == const $CopyWithPlaceholder() || token == null
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $SignInModelCopyWith on SignInModel {
  /// Returns a callable class that can be used as follows: `instanceOfSignInModel.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SignInModelCWProxy get copyWith => _$SignInModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) => SignInModel(
      token: json['token'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
    };
