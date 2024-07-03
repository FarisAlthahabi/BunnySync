import 'package:bunny_sync/features/breeders/models/breeder_model/breeder_model.dart';

class BreedersStatusModel {
  BreedersStatusModel({
    required this.all,
    required this.active,
    required this.inactive,
  });

  final List<BreederModel> all;
  final List<BreederModel> active;
  final List<BreederModel> inactive;
}
