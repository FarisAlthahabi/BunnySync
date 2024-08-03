part of 'add_task_repo.dart';

@Injectable(as: AddTaskRepo)
class HttpAddTaskRepo implements AddTaskRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<TaskModel> addTask(
    TaskPostModel taskPostModel,
  ) async {
    try {
      final response = await _dioClient.post(
        '/schedule',
        data: taskPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return TaskModel.fromJson(body['task'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
