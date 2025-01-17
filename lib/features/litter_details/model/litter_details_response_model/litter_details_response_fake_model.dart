import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/litter_details/model/breeder_pair_model/breeder_pair_model.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litter_details/model/kit_status_model/kit_status_model.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_model/litter_details_model.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_response_model/litter_details_response_model.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';

final litterDetailsResponseFakeModel = LitterDetailsResponseModel(
  litter: litterDetailsFakeModel,
  fosterKits: const [],
  age: '3 Days',
  totalWeight: 0,
  activeLittersCount: 10,
  diedLittersCount: 3,
  survivalRate: 100,
);

final litterDetailsFakeModel = LitterDetailsModel(
  id: 1,
  userId: 1,
  breedPairId: 1,
  litterId: 'AC-1',
  type: "manually",
  prefix: 'nux',
  tatto: 'tatto',
  breedDate: DateTime.now(),
  bronDate: DateTime.now(),
  status: 'active',
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
  kits: fakeKits,
  breederPairModel: breederPairFakeModel,
);

final List<KitModel> fakeKits = List.generate(
  4,
  (index) => KitModel(
    status: fakeKitStatusModel,
    id: index,
    userId: 1,
    litterId: 1,
    code: 'code',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);

final breederPairFakeModel = BreederPairModel(
  id: 1,
  userId: 1,
  femaleBreederId: 93,
  maleBreederId: 88,
  type: "manually",
  date: DateTime.now(),
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
  maleBreeder: fakeMaleBreeder,
  femaleBreeder: fakeFemaleBreeder,
);

final fakeMaleBreeder = BreederEntryModel(
  isActive: false,
  id: 88,
  userId: 1,
  uuid: '1',
  displayName: 'nux',
  photo: '',
  updatedAt: DateTime.now(),
  createdAt: DateTime.now(),
  gender: GenderTypes.male,
);

final fakeFemaleBreeder = BreederEntryModel(
  isActive: false,
  id: 93,
  userId: 1,
  uuid: '1',
  displayName: 'nux',
  photo: '',
  updatedAt: DateTime.now(),
  createdAt: DateTime.now(),
  gender: GenderTypes.female,
);

final fakeKitStatusModel = KitStatusModel(
  id: 1,
  kitId: 1,
  status: 'acticve',
  isActive: true,
  date: DateTime.now(),
  foster: 1,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
