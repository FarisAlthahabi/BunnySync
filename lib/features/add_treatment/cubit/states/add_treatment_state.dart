part of '../add_treatment_cubit.dart';

@immutable
abstract class AddTreatmentState extends GeneralAddTreatmentState {}

class AddTreatmentInitial extends AddTreatmentState {}

class AddTreatmentLoading extends AddTreatmentState {}

class AddTreatmentSuccess extends AddTreatmentState {
  AddTreatmentSuccess(this.treatment);

  final TreatmentModel treatment;
}

class UpdateTreatmentSuccess extends AddTreatmentState {
  UpdateTreatmentSuccess(this.treatment);

  final TreatmentModel treatment;
}

class AddTreatmentFail extends AddTreatmentState {
  AddTreatmentFail(this.message);

  final String message;
}
