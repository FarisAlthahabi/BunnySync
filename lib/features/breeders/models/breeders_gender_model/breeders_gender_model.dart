import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';

class BreedersGenderModel {
  BreedersGenderModel({
    required this.maleBreeders,
    required this.femaleBreeders,
  });

  final List<BreederEntryModel> maleBreeders;
  final List<BreederEntryModel> femaleBreeders;
}
