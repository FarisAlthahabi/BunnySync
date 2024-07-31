part of '../add_category_cubit.dart';

@immutable
abstract class AddCategoryState extends GeneralAddCategoryState {}

class AddCategoryInitial extends AddCategoryState {}

class AddCategoryLoading extends AddCategoryState {}

class AddCategorySuccess extends AddCategoryState {
  AddCategorySuccess(this.categoryModel);

  final CategoryModel categoryModel;
}

class AddCategoryFail extends AddCategoryState {
  AddCategoryFail(this.message);

  final String message;
}
