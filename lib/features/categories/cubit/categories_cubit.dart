import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'states/categories_state.dart';
part 'states/general_categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
}
