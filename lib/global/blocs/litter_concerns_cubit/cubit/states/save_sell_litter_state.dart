part of '../litter_concerns_cubit.dart';

@immutable
abstract class SaveSellLitterState extends GeneralLitterConcernsState {}

class SaveSellLitterInitial extends SaveSellLitterState {}

class SaveSellLitterLoading extends SaveSellLitterState {}

class SaveSellLitterSuccess extends SaveSellLitterState {}

class SaveSellLitterFail extends SaveSellLitterState {
  SaveSellLitterFail(this.message);

  final String message;
}
