import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum CagePlacementTypes implements DropDownItemModel {
  blank,
  prefix,
  name,
  breed,
  cage,
  idType,
  sex,
  father,
  mother,
  color,
  weight,
  acquired,
  dateOfBirth,
  images,
  culled,
  kits,
  tattoo,
  category,
  genotype,
  currentDate,
  weightDate,
  currentWeight,
  vWDuGenotype;

  @override
  String get displayName {
    switch (this) {
      case CagePlacementTypes.blank:
        return 'blank'.i18n;
      case CagePlacementTypes.prefix:
        return 'prefix'.i18n;
      case CagePlacementTypes.name:
        return 'name'.i18n;
      case CagePlacementTypes.breed:
        return 'breed'.i18n;
      case CagePlacementTypes.cage:
        return 'cage'.i18n;
      case CagePlacementTypes.idType:
        return 'id_type'.i18n;
      case CagePlacementTypes.sex:
        return 'sex'.i18n;
      case CagePlacementTypes.father:
        return 'father'.i18n;
      case CagePlacementTypes.mother:
        return 'mother'.i18n;
      case CagePlacementTypes.color:
        return 'color'.i18n;
      case CagePlacementTypes.weight:
        return 'weight'.i18n;
      case CagePlacementTypes.acquired:
        return 'acquired'.i18n;
      case CagePlacementTypes.dateOfBirth:
        return 'date_of_birth'.i18n;
      case CagePlacementTypes.images:
        return 'images'.i18n;
      case CagePlacementTypes.culled:
        return 'culled'.i18n;
      case CagePlacementTypes.kits:
        return 'kits'.i18n;
      case CagePlacementTypes.tattoo:
        return 'tattoo'.i18n;
      case CagePlacementTypes.category:
        return 'category'.i18n;
      case CagePlacementTypes.genotype:
        return 'genotype'.i18n;
      case CagePlacementTypes.currentDate:
        return 'current_date'.i18n;
      case CagePlacementTypes.weightDate:
        return 'weight_date'.i18n;
      case CagePlacementTypes.currentWeight:
        return 'current_weight'.i18n;
      case CagePlacementTypes.vWDuGenotype:
        return 'vWDu_genotype'.i18n;
    }
  }

  @override
  int get id {
    return CagePlacementTypes.idType.id;
  }

  static CagePlacementTypes fromJson(String json) {
    return CagePlacementTypes.values.byName(json.toCamelCase);
  }

  static List<CagePlacementTypes> fromListJson(List<dynamic> list) {
    return list
        .map(
          (e) => CagePlacementTypes.values.byName(
            (e as String).toCamelCase,
          ),
        )
        .toList();
  }

  static List<String> toListJson(List<CagePlacementTypes> list) {
    return list.map((e) => e.name).toList();
  }
}
