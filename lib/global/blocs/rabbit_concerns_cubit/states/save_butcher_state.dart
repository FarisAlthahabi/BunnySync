part of '../rabbit_concerns_cubit.dart';

@immutable
abstract class SaveButcherState extends GeneralRabbitConcernsState {}

class SaveButcherInitial extends SaveButcherState {}

class SaveButcherLoading extends SaveButcherState {}

class SaveButcherSuccess extends SaveButcherState {}

class SaveButcherFail extends SaveButcherState {
  SaveButcherFail(this.message);

  final String message;
}
