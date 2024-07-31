import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/categories/model/categories_fake_model.dart';
import 'package:bunny_sync/features/categories/model/category_model.dart';
import 'package:bunny_sync/features/categories/repo/categories_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/categories_state.dart';
part 'states/general_categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitial());

  final CategoriesRepo _categoriesRepo;

  Future<void> getCategories() async {
    emit(CategoriesLoading(fakeCategories));

    try {
      final categories = await _categoriesRepo.getCategories();
      emit(CategoriesSuccess(categories));
    } catch (e, s) {
      addError(e, s);
      emit(CategoriesFail(e.toString()));
    }
  }
}
