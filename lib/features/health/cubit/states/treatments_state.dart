part of '../health_cubit.dart';

@immutable
abstract class TreatmentsState extends GeneralHealthState {}

class TreatmentsInitial extends TreatmentsState {}

class TreatmentsFetch extends TreatmentsState {
  TreatmentsFetch(this.treatments);

  final List<TreatmentModel> treatments;
}

class TreatmentsLoading extends TreatmentsFetch {
  TreatmentsLoading(super.treatments);
}

class TreatmentsSuccess extends TreatmentsFetch {
  TreatmentsSuccess(super.treatments);
}

class TreatmentsEmpty extends TreatmentsState {
  TreatmentsEmpty(this.message);

  final String message;
}

class TreatmentsFail extends TreatmentsState {
  TreatmentsFail(this.message);

  final String message;
}
