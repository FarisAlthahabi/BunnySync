import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:injectable/injectable.dart';

part 'http_health_repo.dart';

abstract class HealthRepo {
  Future<List<AilmentModel>> getAilments();

  Future<List<TreatmentModel>> getTreatments();

  Future<void> deleteAilment(int ailmentId);

  Future<void> deleteTreatment(int treatmentId);
}
