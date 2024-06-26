import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  genericArgumentFactories: true,
)
class ResponseModel<T> {
  const ResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) dataFromJson,
  ) {
    return _$ResponseModelFromJson(json, dataFromJson);
  }

  final bool success;

  final T data;

  @JsonKey(name: 'message', defaultValue: '')
  final String message;


  Map<String, dynamic> toJson(
    Object Function(T value) dataToJson,
  ) {
    return _$ResponseModelToJson(this, dataToJson);
  }
}
