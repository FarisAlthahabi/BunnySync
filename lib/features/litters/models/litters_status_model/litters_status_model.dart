import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';

class LittersStatusModel {
  LittersStatusModel({
    required this.all,
    required this.active,
    required this.inactive,
  });

  final List<LitterEntryModel> all;
  final List<LitterEntryModel> active;
  final List<LitterEntryModel> inactive;
}
