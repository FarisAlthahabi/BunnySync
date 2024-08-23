part of '../rabbit_concerns_cubit.dart';

@immutable
abstract class BreederWeightsState extends GeneralRabbitConcernsState {}

class BreederWeightsInitial extends BreederWeightsState {}

class BreederWeightsLoading extends BreederWeightsState {}

class BreederWeightsSuccess extends BreederWeightsState {
  BreederWeightsSuccess(this.weights);

  final List<WeightModel> weights;
}

class BreederWeightsEmpty extends BreederWeightsState {
  BreederWeightsEmpty(this.message);

  final String message;
}

class BreederWeightsFail extends BreederWeightsState {
  BreederWeightsFail(this.message);

  final String message;
}
