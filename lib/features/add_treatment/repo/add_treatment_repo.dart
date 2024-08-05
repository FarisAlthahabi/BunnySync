import 'package:bunny_sync/features/add_treatment/model/treatment_post_model/treatment_post_model.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_add_treatment_repo.dart';

abstract class AddTreatmentRepo {
  Future<TreatmentModel> addTreatment(
    TreatmentPostModel treatmentPostModel,
  );

  Future<TreatmentModel> updateTreatment(
    TreatmentPostModel treatmentPostModel,
    int treatmentId,
  );
}
