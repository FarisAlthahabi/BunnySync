import 'package:bunny_sync/features/add_treatment/model/dosage_per_types/dosage_per_types.dart';
import 'package:bunny_sync/features/add_treatment/model/dosage_types/dosage_types.dart';
import 'package:bunny_sync/features/add_treatment/model/period_types/period_types.dart';
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
    dosageType: DosageTypes.litter,
    dosageCountPer: 1,
    dosageTypePer: DosagePerTypes.kg,
    scheduleCount: 2,
    scheduleType: PeriodTypes.days,
    withDrawalCount: 2,
    withDrawalType: PeriodTypes.days,
    note: 'note',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);
