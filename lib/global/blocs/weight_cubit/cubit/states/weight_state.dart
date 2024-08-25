part of '../weight_cubit.dart';

@immutable
abstract class UpdateWeightState extends GeneralWeightState {}

class UpdateWeightInitial extends UpdateWeightState {}

class UpdateWeightLoading extends UpdateWeightState {}

class UpdateWeightSuccess extends UpdateWeightState {}

class UpdateWeightFail extends UpdateWeightState {
  UpdateWeightFail(this.message);

  final String message;
}


