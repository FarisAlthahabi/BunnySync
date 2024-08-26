part of '../weight_cubit.dart';

@immutable
abstract class GetAllWeightsState extends GeneralWeightState {}

class GetAllWeightsInitial extends GetAllWeightsState {}

class GetAllWeightsLoading extends GetAllWeightsState {}

class GetAllWeightsSuccess extends GetAllWeightsState {
  GetAllWeightsSuccess(this.weights);

  final List<WeightModel> weights;
}

class GetAllWeightsEmpty extends GetAllWeightsState {
  GetAllWeightsEmpty(this.message);

  final String message;
}

class GetAllWeightsFail extends GetAllWeightsState {
  GetAllWeightsFail(this.message);

  final String message;
}
