part of '../health_cubit.dart';

@immutable
abstract class AilmentsState extends GeneralHealthState {}

class AilmentsInitial extends AilmentsState {}

class AilmentsFetch extends AilmentsState {
  AilmentsFetch(this.ailments);

  final List<AilmentModel> ailments;
}

class AilmentsLoading extends AilmentsFetch {
  AilmentsLoading(super.ailments);
}

class AilmentsSuccess extends AilmentsFetch {
  AilmentsSuccess(super.ailments);
}

class AilmentsEmpty extends AilmentsState {
  AilmentsEmpty(this.message);

  final String message;
}

class AilmentsFail extends AilmentsState {
  AilmentsFail(this.message);

  final String message;
}
