// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_out_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LogOutModelCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// LogOutModel(...).copyWith(id: 12, name: "My name")
  /// ````
  LogOutModel call({
    List<dynamic>? data,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLogOutModel.copyWith(...)`.
class _$LogOutModelCWProxyImpl implements _$LogOutModelCWProxy {
  const _$LogOutModelCWProxyImpl(this._value);

  final LogOutModel _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// LogOutModel(...).copyWith(id: 12, name: "My name")
  /// ````
  LogOutModel call({
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return LogOutModel(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<dynamic>?,
    );
  }
}

extension $LogOutModelCopyWith on LogOutModel {
  /// Returns a callable class that can be used as follows: `instanceOfLogOutModel.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$LogOutModelCWProxy get copyWith => _$LogOutModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogOutModel _$LogOutModelFromJson(Map<String, dynamic> json) => LogOutModel(
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$LogOutModelToJson(LogOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
