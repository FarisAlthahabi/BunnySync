part of '../rabbit_concerns_cubit.dart';

@immutable
abstract class SaveSellState extends GeneralRabbitConcernsState {}

class SaveSellInitial extends SaveSellState {}

class SaveSellLoading extends SaveSellState {}

class SaveSellSuccess extends SaveSellState {}

class SaveSellFail extends SaveSellState {
  SaveSellFail(this.message);

  final String message;
}
