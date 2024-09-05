import 'package:bunny_sync/features/reports/models/breeder_mortality_model/breeder_mortality_model.dart';

final breederMortalityFake = List.generate(
  4,
  (index) => BreederMortalityModel(
    name: 'nux',
    age: 5,
    reason: 'stillborn',
    deathDate: DateTime.now(),
    dtRowIndex: 1,
  ),
);
