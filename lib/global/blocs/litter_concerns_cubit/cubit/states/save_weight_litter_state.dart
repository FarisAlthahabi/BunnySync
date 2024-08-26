part of '../litter_concerns_cubit.dart';

@immutable
abstract class SaveWeightLitterState extends GeneralLitterConcernsState {}

class SaveWeightLitterInitial extends SaveWeightLitterState {}

class SaveWeightLitterLoading extends SaveWeightLitterState {}

class SaveWeightLitterSuccess extends SaveWeightLitterState {}

class SaveWeightLitterFail extends SaveWeightLitterState {
  SaveWeightLitterFail(this.message);

  final String message;
}
