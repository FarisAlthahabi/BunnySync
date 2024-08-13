part of '../categories_cubit.dart';

@immutable
abstract class DeleteCategoryState extends GeneralCategoriesState {}

class DeleteCategorySuccess extends DeleteCategoryState {
  DeleteCategorySuccess();
}

class DeleteCategoryLoading extends DeleteCategoryState {}

class DeleteCategoryFail extends DeleteCategoryState {
  DeleteCategoryFail(this.message);

  final String message;
}
