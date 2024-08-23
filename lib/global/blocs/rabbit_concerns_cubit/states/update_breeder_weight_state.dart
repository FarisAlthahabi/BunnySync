part of '../rabbit_concerns_cubit.dart';

@immutable
abstract class UpdateBreederWeightState extends GeneralRabbitConcernsState {}

class UpdateBreederWeightInitial extends UpdateBreederWeightState {}

class UpdateBreederWeightLoading extends UpdateBreederWeightState {}

class UpdateBreederWeightSuccess extends UpdateBreederWeightState {
  UpdateBreederWeightSuccess(this.wightModel);

  final WeightModel wightModel;
}

class UpdateBreederWeightFail extends UpdateBreederWeightState {
  UpdateBreederWeightFail(this.message);

  final String message;
}
