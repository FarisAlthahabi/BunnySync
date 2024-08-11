part of '../categories_cubit.dart';

@immutable
abstract class CategoriesState extends GeneralCategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesFetch extends CategoriesState {
  CategoriesFetch(this.categories);

  final List<CategoryModel> categories;
}

class CategoriesLoading extends CategoriesFetch {
  CategoriesLoading(super.categories);
}

class CategoriesSuccess extends CategoriesFetch {
  CategoriesSuccess(super.categories);
}

class CategoriesEmpty extends CategoriesState {
  CategoriesEmpty(this.message);

  final String message;
}

class CategoriesFail extends CategoriesState {
  CategoriesFail(this.message);

  final String message;
}
