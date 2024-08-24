part of 'tasks_repo.dart';

@Injectable(as: TasksRepo)
class HttpTasksRepo implements TasksRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<List<TaskModel>> getTasks({
    int? breederId,
    int? litterId,
  }) async {
    try {
      final response = await _dioClient.post(
        '/schedule/data',
        queries: {
          if (breederId != null && litterId == null) 'breeder_id': breederId,
          if (litterId != null && breederId == null) 'litter_id' : litterId,
        },
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => TaskModel.fromJson(body[index] as Map<String, dynamic>),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(int taskId) async {
    try {
      await _dioClient.delete(
        '/schedule/$taskId',
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
