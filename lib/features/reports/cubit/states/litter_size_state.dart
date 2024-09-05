part of '../reports_cubit.dart';

@immutable
abstract class LitterSizeState extends GeneralReportsState {}

class LitterSizeInitial extends LitterSizeState {}

class LitterSizeFetch extends LitterSizeState {
  LitterSizeFetch(this.litterSize);

  final LitterSizeModel litterSize;
}

class LitterSizeLoading extends LitterSizeFetch {
  LitterSizeLoading(super.litterSize);
}

class LitterSizeSuccess extends LitterSizeFetch {
  LitterSizeSuccess(super.litterSize);
}

class LitterSizeFail extends LitterSizeState {
  LitterSizeFail(this.message);

  final String message;
}
