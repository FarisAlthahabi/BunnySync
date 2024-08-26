part of '../add_weight_cubit.dart';

@immutable
sealed class AddWeightState extends GeneralAddWeightState {}

class AddWeightInitial extends AddWeightState {}

class AddWeightLoading extends AddWeightState {}

class AddWeightSuccess extends AddWeightState {}

class AddWeightFail extends AddWeightState {
  AddWeightFail(this.message);

  final String message;
}
