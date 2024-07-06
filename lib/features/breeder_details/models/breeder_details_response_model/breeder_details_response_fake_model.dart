import 'package:bunny_sync/features/breeder_details/models/breeder_details_model/breeder_details_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_model/detail_model/detail_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_model/status_model/status_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_model/weights_model/weights_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_model.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';

final breederDetailsResponseFakeModel = BreederDetailsResponseModel(
  age: '10',
  weight: '10.2 lb',
  breeder: breederDetailsFakeModel,
  kitsCount: 88,
  littersCount: 12,
);
final breederDetailsFakeModel = BreederDetailsModel(
  id: 1,
  userId: 1,
  uuid: '1',
  name: 'bunny',
  prefix: 'nux',
  cage: 'ABC',
  gender: GenderTypes.male,
  color: 'red',
  tatto: 'tatto',
  breed: 'breed',
  updatedAt: DateTime.now(),
  createdAt: DateTime.now(),
  status: statusFake,
  detail: detailFake,
);
final statusFake = StatusModel(
  id: 1,
  breederId: 1,
  status: 'active',
  date: DateTime.now(),
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
final detailFake = DetailModel(
  id: 1,
  breederId: 1,
  broken: 0,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
final weightsFake = WeightsModel(
  id: 1,
  breederId: 1,
  weight: 10.2,
  date: DateTime.now(),
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
