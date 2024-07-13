import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';

class BreedersGenderModel {
  BreedersGenderModel({
    required this.maleBreeders,
    required this.femaleBreeders,
    required this.maleBreedersNames,
    required this.femaleBreedersNames,
  });

  final List<BreederEntryModel> maleBreeders;
  final List<BreederEntryModel> femaleBreeders;
  final List<String> maleBreedersNames;
  final List<String> femaleBreedersNames;
}
