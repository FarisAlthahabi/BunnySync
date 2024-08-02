import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';

final customerFakeModel = List.generate(
  3,
  (index) => CustomerModel(
    id: index,
    userId: 51,
    status: 'active',
    email: 'bayuangkasa@gmail.com',
    name: 'Bayu Santoso',
    type: 'Lead',
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
