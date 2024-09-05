part of '../add_cage_cubit.dart';

@immutable
abstract class AddCageState extends GeneralAddCageState {}

class AddCageInitial extends AddCageState {}

class AddCageLoading extends AddCageState {}

class AddCageSuccess extends AddCageState {
  AddCageSuccess(this.cageModel);

  final CageModel cageModel;
}

class UpdateCageSuccess extends AddCageState {
  UpdateCageSuccess(this.cageModel);

  final CageModel cageModel;
}

class AddCageCopySuccess extends AddCageState {
  AddCageCopySuccess(this.cageModel);

  final CageModel cageModel;
}

class AddCageFail extends AddCageState {
  AddCageFail(this.message);

  final String message;
}
