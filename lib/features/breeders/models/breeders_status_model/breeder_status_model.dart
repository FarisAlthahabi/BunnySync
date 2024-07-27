import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';

class BreedersStatusModel {
  BreedersStatusModel({
    required this.all,
    required this.active,
    required this.inactive,
  });

  BreedersStatusModel.empty()
      : all = [],
        active = [],
        inactive = [];

  final List<BreederEntryModel> all;
  final List<BreederEntryModel> active;
  final List<BreederEntryModel> inactive;

  BreedersStatusModel copyWith({
    List<BreederEntryModel>? all,
    List<BreederEntryModel>? active,
    List<BreederEntryModel>? inactive,
  }) {
    return BreedersStatusModel(
      all: all ?? this.all,
      active: active ?? this.active,
      inactive: inactive ?? this.inactive,
    );
  }
}
