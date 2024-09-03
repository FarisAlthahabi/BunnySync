import 'package:bunny_sync/features/reports/models/kit_mortality_model/kit_mortality_model.dart';

final kitMortalityFake = List.generate(
  4,
  (index) => KitMortalityModel(
    maleBreederName: 'Nux',
    maleBreederId: 93,
    femaleBreederName: 'Nux 2',
    femaleBreederId: 93,
    litterName: 'AC-22',
    litterId: 14,
    kitName: 'Qrt56v',
    updatedAt: DateTime.now(),
    reason: 'stillborn',
    deathDate: DateTime.now(),
    dtRowIndex: 1,
  ),
);
