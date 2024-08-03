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
    type: 'breed',
    recurring: "1",
    note: 'Please check',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);
