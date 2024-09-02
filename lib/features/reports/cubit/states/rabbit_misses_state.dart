part of '../reports_cubit.dart';

@immutable
abstract class RabbitMissesState extends GeneralReportsState {}

class RabbitMissesInitial extends RabbitMissesState {}

class RabbitMissesFetch extends RabbitMissesState {
  RabbitMissesFetch(this.rabbitMisses);

  final RabbitMissesModel rabbitMisses;
}

class RabbitMissesLoading extends RabbitMissesFetch {
  RabbitMissesLoading(super.rabbitMisses);
}

class RabbitMissesSuccess extends RabbitMissesFetch {
  RabbitMissesSuccess(super.rabbitMisses);
}

class RabbitMissesFail extends RabbitMissesState {
  RabbitMissesFail(this.message);

  final String message;
}
