part of '../rabbit_concerns_cubit.dart';

@immutable
abstract class SaveBirthState extends GeneralRabbitConcernsState {}

class SaveBirthInitial extends SaveBirthState {}

class SaveBirthLoading extends SaveBirthState {}

class SaveBirthSuccess extends SaveBirthState {}

class SaveBirthFail extends SaveBirthState {
  SaveBirthFail(this.message);

  final String message;
}
