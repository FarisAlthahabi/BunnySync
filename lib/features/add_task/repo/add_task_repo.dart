import 'package:bunny_sync/features/add_task/model/task_post_model/task_post_model.dart';
import 'package:bunny_sync/features/tasks/models/task_model/task_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:injectable/injectable.dart';

part 'http_add_task_repo.dart';

abstract class AddTaskRepo {
  Future<TaskModel> addTask(
    TaskPostModel addTaskModel,
  );

  Future<TaskModel> updateTask(
    TaskPostModel taskPostModel,
    int taskId,
  );
}
