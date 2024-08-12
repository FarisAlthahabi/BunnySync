part of '../health_cubit.dart';

@immutable
abstract class DeleteTreatmentState extends GeneralHealthState {}

class DeleteTreatmentSuccess extends DeleteTreatmentState {
  DeleteTreatmentSuccess();
}

class DeleteTreatmentLoading extends DeleteTreatmentState {}

class DeleteTreatmentFail extends DeleteTreatmentState {
  DeleteTreatmentFail(this.message);

  final String message;
}
