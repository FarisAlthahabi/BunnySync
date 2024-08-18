import 'package:bunny_sync/features/add_ailment/model/ailment_types/ailment_status_types.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_fake_model.dart';

final fakeAilments = List.generate(
  4,
  (index) => AilmentModel(
    id: index,
    breederId: 88,
    userId: 51,
    displayName: 'ailment',
    symptoms: 'symptoms',
    startDate: DateTime.now(),
    note: 'note',
    status: AilmentStatusTypes.active,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    treatments: fakeTreatments,
  ),
);
