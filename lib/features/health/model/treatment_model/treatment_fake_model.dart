import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';

final fakeTreatments = List.generate(
  4,
  (index) => TreatmentModel(
    id: index,
    userId: 51,
    ailmentId: 10,
    name: 'name',
    startDate: DateTime.now(),
    medication: 'medication',
    method: 'method',
    type: 'type',
    dosageCount: 2,
    dosageType: 'dosageType',
    dosageCountPer: 1,
    dosageTypePer: '1lb',
    scheduleCount: 2,
    scheduleType: 'scheduleType',
    withDrawalCount: 2,
    withDrawalType: 'widthDrawalType',
    note: 'note',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);
