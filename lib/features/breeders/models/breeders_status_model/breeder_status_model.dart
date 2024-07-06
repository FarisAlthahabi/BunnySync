import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';

class BreedersStatusModel {
  BreedersStatusModel({
    required this.all,
    required this.active,
    required this.inactive,
  });

  final List<BreederEntryModel> all;
  final List<BreederEntryModel> active;
  final List<BreederEntryModel> inactive;
}
