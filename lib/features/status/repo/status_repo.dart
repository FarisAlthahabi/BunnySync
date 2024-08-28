import 'package:bunny_sync/features/status/models/statusable_model.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/utils/enums/http_methods.dart';
import 'package:injectable/injectable.dart';

part 'http_status_repo.dart';

abstract class StatusRepo {
  Future<void> changeStatus(
    StatusableModel statusableModel,
    StatusTypes statusType,
  );
}
