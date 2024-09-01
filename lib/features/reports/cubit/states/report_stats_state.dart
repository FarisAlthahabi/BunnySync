part of '../reports_cubit.dart';

@immutable
abstract class ReportStatsState extends GeneralReportsState {}

class ReportStatsInitial extends ReportStatsState {}

class ReportStatsFetch extends ReportStatsState {
  ReportStatsFetch(this.reportStats);

  final ReportStatsModel reportStats;
}

class ReportStatsLoading extends ReportStatsFetch {
  ReportStatsLoading(super.reportStats);
}

class ReportStatsSuccess extends ReportStatsFetch {
  ReportStatsSuccess(super.reportStats);
}

class ReportStatsFail extends ReportStatsState {
  ReportStatsFail(this.message);

  final String message;
}
