import 'package:bunny_sync/features/tasks/models/task_model/task_model.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_tasks_repo.dart';

abstract class TasksRepo {
  Future<List<TaskModel>> getTasks({
    int? breederId,
    int? litterId,
  });

  Future<void> deleteTask(int taskId);

  Future<TaskModel> changeTaskStatus(
    int taskId,
    StatusTypes taskStatusType,
  );
}
