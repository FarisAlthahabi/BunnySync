import 'package:bunny_sync/features/breeder_details/models/pedigree_model/pedigree_model.dart';
import 'package:bunny_sync/features/breeder_details/models/pedigree_model/pedigree_status_model/pedigree_status_model.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';

final pedigreeFakeModel = PedigreeModel(
  id: 1,
  userId: 1,
  uuid: '1',
  categoryBreederId: 1,
  name: 'nux',
  prefix: 'nux-1',
  cage: 'ABC',
  gender: GenderTypes.male.toString(),
  color: 'red',
  tatto: 'tatto',
  breed: 'breed',
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
  images: const [],
  status: pedigreeStatusFakeModel,
);

const pedigreeStatusFakeModel = PedigreeStatusModel(
  breederId: 1,
  status: 'active',
);
