part of '../cage_cards_cubit.dart';

@immutable
abstract class DeleteCageCardState extends GeneralCageCardsState {}

class DeleteCageCardSuccess extends DeleteCageCardState {
  DeleteCageCardSuccess();
}

class DeleteCageCardLoading extends DeleteCageCardState {}

class DeleteCageCardFail extends DeleteCageCardState {
  DeleteCageCardFail(this.message);

  final String message;
}
