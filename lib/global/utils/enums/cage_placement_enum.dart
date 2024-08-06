import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum CagePlacementTypes implements DropDownItemModel {
  blank,
  prefix,
  nameType,
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
  category,
  genotype,
  currentDate,
  weightDate,
  vWDuGenotype;

  @override
  String get name {
    return CagePlacementTypes.nameType.name;
  }

   @override
  int get id {
    return CagePlacementTypes.idType.id;
  }
}
