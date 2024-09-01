part of '../reports_cubit.dart';

@immutable
abstract class KitWeightReportState extends GeneralReportsState {}

class KitWeightReportInitial extends KitWeightReportState {}

class KitWeightReportFetch extends KitWeightReportState {
  KitWeightReportFetch(this.kitWeightReport);

  final KitWeightReportModel kitWeightReport;
}

class KitWeightReportLoading extends KitWeightReportFetch {
  KitWeightReportLoading(super.kitWeightReport);
}

class KitWeightReportSuccess extends KitWeightReportFetch {
  KitWeightReportSuccess(super.kitWeightReport);
}

class KitWeightReportFail extends KitWeightReportState {
  KitWeightReportFail(this.message);

  final String message;
}
