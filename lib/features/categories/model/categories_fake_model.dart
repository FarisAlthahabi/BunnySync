import 'package:bunny_sync/features/categories/model/category_model.dart';

final fakeCategories = List.generate(
  6,
  (index) => CategoryModel(
    id: index,
    userId: 51,
    name: 'general',
    description: 'description',
  ),
);
