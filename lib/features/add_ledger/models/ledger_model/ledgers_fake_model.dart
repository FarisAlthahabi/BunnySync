import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledger_model.dart';
import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/features/ledger/models/ledger_types.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';

final ledgersFakeModel = List.generate(
  6,
  (index) => LedgerModel(
    id: index,
    userId: 51,
    categoryId: 1,
    name: 'name',
    date: DateTime.now(),
    type: LedgerTypes.income,
    status: StatusTypes.active,
    amount: "20 \$",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    category: TaskTypes.breeder,
  ),
);
