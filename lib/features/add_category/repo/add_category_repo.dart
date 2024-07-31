import 'package:bunny_sync/features/add_category/model/category_post_model.dart';
import 'package:bunny_sync/features/categories/model/category_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_add_category_repo.dart';

abstract class AddCategoryRepo {
  Future<CategoryModel> addCategory(
    CategoryPostModel categoryPostModel,
  );
}
