part of '../set_value_cubit.dart';

@immutable
abstract class SaveSellState extends GeneralSetValueState {}

class SaveSellInitial extends SaveSellState {}

class SaveSellLoading extends SaveSellState {}

class SaveSellSuccess extends SaveSellState {}

class SaveSellFail extends SaveSellState {
  SaveSellFail(this.message);

  final String message;
}
