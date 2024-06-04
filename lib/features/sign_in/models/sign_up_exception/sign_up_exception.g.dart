// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_exception.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SignUpExceptionCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SignUpException(...).copyWith(id: 12, name: "My name")
  /// ````
  SignUpException call({
    Map<TextFieldType, List<String>>? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignUpException.copyWith(...)`.
class _$SignUpExceptionCWProxyImpl implements _$SignUpExceptionCWProxy {
  const _$SignUpExceptionCWProxyImpl(this._value);

  final SignUpException _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SignUpException(...).copyWith(id: 12, name: "My name")
  /// ````
  SignUpException call({
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return SignUpException(
      errors: errors == const $CopyWithPlaceholder() || errors == null
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Map<TextFieldType, List<String>>,
    );
  }
}

extension $SignUpExceptionCopyWith on SignUpException {
  /// Returns a callable class that can be used as follows: `instanceOfSignUpException.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SignUpExceptionCWProxy get copyWith => _$SignUpExceptionCWProxyImpl(this);
}
