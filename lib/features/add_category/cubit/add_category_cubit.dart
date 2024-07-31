import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_category/model/category_post_model.dart';
import 'package:bunny_sync/features/add_category/repo/add_category_repo.dart';
import 'package:bunny_sync/features/categories/model/category_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_category_state.dart';
part 'states/general_add_category_state.dart';

@injectable
class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit(this._addCategoryRepo) : super(AddCategoryInitial());

  final AddCategoryRepo _addCategoryRepo;

  CategoryPostModel _categoryPostModel = const CategoryPostModel();

  void setTitle(String title) {
    _categoryPostModel = _categoryPostModel.copyWith(
      title: () => title,
    );
  }

  void setDescription(String description) {
    _categoryPostModel = _categoryPostModel.copyWith(
      description: () => description,
    );
  }

  Future<void> addCategory() async {
    emit(AddCategoryLoading());

    try {
      final note = await _addCategoryRepo.addCategory(_categoryPostModel);
      emit(AddCategorySuccess(note));
    } catch (e, s) {
      addError(e, s);
      emit(AddCategoryFail(e.toString()));
    }
  }
}
