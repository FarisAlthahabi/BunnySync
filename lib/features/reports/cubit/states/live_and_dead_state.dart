part of '../reports_cubit.dart';

@immutable
abstract class LiveAndDeadState extends GeneralReportsState {}

class LiveAndDeadInitial extends LiveAndDeadState {}

class LiveAndDeadFetch extends LiveAndDeadState {
  LiveAndDeadFetch(this.liveAndDead);

  final LiveAndDeadModel liveAndDead;
}

class LiveAndDeadLoading extends LiveAndDeadFetch {
  LiveAndDeadLoading(super.liveAndDead);
}

class LiveAndDeadSuccess extends LiveAndDeadFetch {
  LiveAndDeadSuccess(super.liveAndDead);
}

class LiveAndDeadFail extends LiveAndDeadState {
  LiveAndDeadFail(this.message);

  final String message;
}
