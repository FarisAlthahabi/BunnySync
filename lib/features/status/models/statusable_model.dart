import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:bunny_sync/global/utils/enums/http_methods.dart';
import 'package:bunny_sync/global/utils/enums/statusable_entity_types.dart';

abstract class StatusableModel {
  StatusableEntityTypes get entityType;

  StatusTypes? get status;

  int get id;

  String get httpEndpoint;

  HttpMethods get httpMethod;

  StatusableModel copyWithStatus({StatusTypes? status});
}
