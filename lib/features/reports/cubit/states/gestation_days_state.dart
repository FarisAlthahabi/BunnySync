part of '../reports_cubit.dart';

@immutable
abstract class GestationDaysState extends GeneralReportsState {}

class GestationDaysInitial extends GestationDaysState {}

class GestationDaysFetch extends GestationDaysState {
  GestationDaysFetch(this.gestationDays);

  final GestationDaysModel gestationDays;
}

class GestationDaysLoading extends GestationDaysFetch {
  GestationDaysLoading(super.gestationDays);
}

class GestationDaysSuccess extends GestationDaysFetch {
  GestationDaysSuccess(super.gestationDays);
}

class GestationDaysFail extends GestationDaysState {
  GestationDaysFail(this.message);

  final String message;
}
