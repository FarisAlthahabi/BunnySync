import 'dart:convert';

import 'package:bunny_sync/features/add_kit/models/post_kit_model/post_kit_model.dart';
import 'package:bunny_sync/features/litter_details/model/kit_status_model/kit_status_model.dart';
import 'package:bunny_sync/features/weight/models/weightable_model/weightable_model.dart';
import 'package:bunny_sync/global/utils/enums/entity_types.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'kit_model.g.dart';

@JsonSerializable()
@immutable
class KitModel extends Equatable
    implements DropDownItemModel, BottomSheetItemModel, WeightableModel {
  const KitModel({
    required this.id,
    required this.userId,
    required this.litterId,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
    this.status,
    this.kitName,
    this.prefix,
    this.color,
    this.breed,
    this.cage,
    this.gender,
    this.note,
  }) : entityType = EntityTypes.kit;

  factory KitModel.fromJsonStr(String str) =>
      KitModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory KitModel.fromJson(Map<String, dynamic> json) =>
      _$KitModelFromJson(json);

  @override
  final EntityTypes entityType;

  @override
  final int id;

  @JsonKey(name: 'user_id', defaultValue: -1)
  final int userId;

  @JsonKey(name: 'litter_id')
  final int litterId;

  @JsonKey(defaultValue: '')
  final String code;

  @JsonKey(name: 'name')
  final String? kitName;

  final String? prefix;

  final String? color;

  final String? breed;

  final String? cage;

  final GenderTypes? gender;

  final String? note;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final KitStatusModel? status;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$KitModelToJson(this);

  @override
  String get displayName => code;

  @override
  List<Object?> get props => [id];

  PostKitModel get toPostKitModel => PostKitModel(
        tatto: code,
        prefix: prefix,
        name: kitName,
        color: color,
        breed: breed,
        cage: cage,
        gender: gender,
        note: note,
      );

  @override
  List<WeightableModel> get subEntities => [];

  @override
  String? get weight => null;

  @override
  String get httpEndpoint => throw UnimplementedError();

  @override
  String get emptySubEntitiesMessage => throw UnimplementedError();

  @override
  String updateHttpEndpoint({int? weightId}) {
    return 'litters/kits/$id/update-weight/$weightId';
  }
  
  @override
  String get addHttpEndpoint => 'litters/kits/$id/save-weight';
}
