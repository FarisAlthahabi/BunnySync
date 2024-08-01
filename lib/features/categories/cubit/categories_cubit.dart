import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/categories/model/categories_fake_model.dart';
import 'package:bunny_sync/features/categories/model/category_model.dart';
import 'package:bunny_sync/features/categories/repo/categories_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/categories_state.dart';
part 'states/general_categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitial());

  final CategoriesRepo _categoriesRepo;

  List<CategoryModel> categories = [];

  Future<void> getCategories() async {
    emit(CategoriesLoading(fakeCategories));

    try {
      final categories = await _categoriesRepo.getCategories();
      this.categories = categories;
      if (categories.isEmpty) {
        emit(CategoriesEmpty("categories_empty".i18n));
      } else {
        emit(CategoriesSuccess(categories));
      }
    } catch (e, s) {
      addError(e, s);
      emit(CategoriesFail(e.toString()));
    }
  }

  void addCategory(CategoryModel category) {
    categories.add(category);
    emit(CategoriesSuccess(categories));
  }

  void updateCategory(CategoryModel category) {
    categories = categories.map((e) {
      if (e.id == category.id) {
        return category;
      }
      return e;
    }).toList();
    emit(CategoriesSuccess(categories));
  }

  Future<void> deleteCategory(int categoryId) async {
    try {
      await _categoriesRepo.deleteCategory(categoryId);
      categories.removeWhere(
        (element) => element.id == categoryId,
      );
      emit(DeleteCategorySuccess(categories));
    } catch (e, s) {
      addError(e, s);
      emit(CategoriesFail(e.toString()));
    }
  }
}
