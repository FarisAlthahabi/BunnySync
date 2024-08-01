part of 'add_category_repo.dart';

@Injectable(as: AddCategoryRepo)
class HttpAddCategoryRepo implements AddCategoryRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<CategoryModel> addCategory(
    CategoryPostModel categoryPostModel,
  ) async {
    try {
      final response = await _dioClient.post(
        '/finance/category',
        data: categoryPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return CategoryModel.fromJson(body['category'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<CategoryModel> updateCategory(
    CategoryPostModel categoryPostModel,
    int categoryId,
  ) async {
    try {
      final response = await _dioClient.put(
        '/finance/category/$categoryId',
        data: categoryPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return CategoryModel.fromJson(body['category'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
