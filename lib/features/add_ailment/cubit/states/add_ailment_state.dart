part of '../add_ailment_cubit.dart';

@immutable
abstract class AddAilmentState extends GeneralAddAilmentState {}

class AddAilmentInitial extends AddAilmentState {}

class AddAilmentLoading extends AddAilmentState {}

class AddAilmentSuccess extends AddAilmentState {
  AddAilmentSuccess(this.ailment);

  final AilmentModel ailment;
}

class UpdateAilmentSuccess extends AddAilmentState {
  UpdateAilmentSuccess(this.ailment);

  final AilmentModel ailment;
}

class AddAilmentFail extends AddAilmentState {
  AddAilmentFail(this.message);

  final String message;
}
