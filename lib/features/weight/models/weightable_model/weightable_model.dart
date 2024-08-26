import 'package:bunny_sync/global/utils/enums/entity_types.dart';

abstract class WeightableModel {
  EntityTypes get entityType;

  int get id;

  String get displayName;

  String? get weight;

  List<WeightableModel> get subEntities;

  String get httpEndpoint;

  String get emptySubEntitiesMessage;
}
