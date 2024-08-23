part of '../rabbit_concerns_cubit.dart';

@immutable
abstract class SetActiveState extends GeneralRabbitConcernsState {}

class SetActiveInitial extends SetActiveState {}

class SetActiveLoading extends SetActiveState {}

class SetActiveSuccess extends SetActiveState {}

class SetActiveFail extends SetActiveState {
  SetActiveFail(this.message);

  final String message;
}
