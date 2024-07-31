import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'category_post_model.g.dart';

@JsonSerializable()
@immutable
class CategoryPostModel {
  const CategoryPostModel({
    String? title,
    String? description,
  })  : _title = title,
        _description = description;

  factory CategoryPostModel.fromJsonStr(String str) =>
      CategoryPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CategoryPostModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryPostModelFromJson(json);

  final String? _title;

  final String? _description;

  CategoryPostModel copyWith({
    String? Function()? title,
    String? Function()? description,
  }) {
    return CategoryPostModel(
      title: title != null ? title() : _title,
      description: description != null ? description() : _description,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CategoryPostModelToJson(this);

  String get title {
    return _title ?? (throw Exception('title is null'));
  }
  
  @JsonKey(name: 'desc')
  String get description {
    return _description ?? (throw Exception('description is null'));
  }
}
