import 'package:bunny_sync/features/categories/model/category_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_categories_repo.dart';

abstract class CategoriesRepo {
  Future<List<CategoryModel>> getCategories();

  Future<void> deleteCategory(int categoryId);
}
