import 'package:bunny_sync/features/add_customer/model/customer_types/customer_types.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';

final customersFakeModel = List.generate(
  3,
  (index) => CustomerModel(
    id: index,
    userId: 51,
    status: StatusTypes.active,
    email: 'bayuangkasa@gmail.com',
    name: 'Bayu Santoso',
    type: CustomerTypes.customer,
    companyName: 'Bayu Company',
    phone: '083493902',
    note: 'Customer from my friend',
    street: 'New york 12',
    city: 'New York',
    country: 'New York',
    state: 'Manhattan',
    zipCode: '126',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    date: DateTime.now(),
    dtRowIndex: index,
  ),
);
