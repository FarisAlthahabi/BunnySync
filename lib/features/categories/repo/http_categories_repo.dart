part of 'categories_repo.dart';

@Injectable(as: CategoriesRepo)
class HttpCategoriesRepo implements CategoriesRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dioClient.post(
        '/finance/category/data',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => CategoryModel.fromJson(body[index] as Map<String, dynamic>),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
