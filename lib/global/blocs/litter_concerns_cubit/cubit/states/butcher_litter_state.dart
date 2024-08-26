part of '../litter_concerns_cubit.dart';

@immutable
abstract class ButcherLitterState extends GeneralLitterConcernsState {}

class ButcherLitterInitial extends ButcherLitterState {}

class ButcherLitterLoading extends ButcherLitterState {}

class ButcherLitterSuccess extends ButcherLitterState {}

class ButcherLitterFail extends ButcherLitterState {
  ButcherLitterFail(this.message);

  final String message;
}
