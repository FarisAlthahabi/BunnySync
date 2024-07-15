import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_model/breeders_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_status_model/breeder_status_model.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';

final fakeBreedersStatusModel = BreedersStatusModel(
  all: fakeBreedersModel.breeders,
  active: fakeBreedersModel.breeders,
  inactive: fakeBreedersModel.breeders,
);

final fakeBreedersModel = BreedersModel(
  draw: 0,
  recordsTotal: 10,
  recordsFiltered: 10,
  breeders: [
    BreederEntryModel(
      id: 24,
      userId: 1,
      uuid: 'uuid 1',
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      name: 'Breeder 1',
      prefix: 'Prefix 1',
      cage: 'Cage 1',
      weight: '1.0',
      litters: 10,
      kits: 10,
      age: '10',
      status: 'Status 1',
      photo: 'Photo 1',
      dtRowIndex: 1,
      gender: GenderTypes.male,
    ),
    BreederEntryModel(
      id: 24,
      userId: 1,
      uuid: 'uuid 1',
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      name: 'Breeder 1',
      prefix: 'Prefix 1',
      cage: 'Cage 1',
      weight: '1.0',
      litters: 10,
      kits: 10,
      age: '10',
      status: 'Status 1',
      photo: 'Photo 1',
      dtRowIndex: 1,
      gender: GenderTypes.male,
    ),
    BreederEntryModel(
      id: 24,
      userId: 1,
      uuid: 'uuid 1',
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      name: 'Breeder 1',
      prefix: 'Prefix 1',
      cage: 'Cage 1',
      weight: '1.0',
      litters: 10,
      kits: 10,
      age: '10',
      status: 'Status 1',
      photo: 'Photo 1',
      dtRowIndex: 1,
      gender: GenderTypes.male,
    ),
  ],
);
