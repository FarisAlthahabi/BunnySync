import 'package:bunny_sync/features/add_ailment/model/recurring_periods_types/recurring_periods_types.dart';
import 'package:bunny_sync/features/add_task/model/task_genres/task_genres.dart';
import 'package:bunny_sync/features/tasks/model/task_model/task_model.dart';

final fakeTasks = List.generate(
  4,
  (index) => TaskModel(
    id: index,
    userId: 51,
    breederId: 88,
    name: 'Set daily check weight',
    startDate: DateTime.now(),
    dueDate: DateTime.now(),
    type: TaskGenres.weight,
    recurring: RecurringPeriodsTypes.every2Weeks,
    note: 'Please check',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);
