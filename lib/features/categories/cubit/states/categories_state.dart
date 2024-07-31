part of '../categories_cubit.dart';

@immutable
abstract class CategoriesState extends GeneralCategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesFetch extends CategoriesState {}

class CategoriesLoading extends CategoriesFetch {}

class CategoriesSuccess extends CategoriesFetch {}

class CategoriesFail extends CategoriesState {
  CategoriesFail(this.message);

  final String message;
}
