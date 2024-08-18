part of '../cage_cards_cubit.dart';

@immutable
abstract class CageCardsState extends GeneralCageCardsState {}

class CageCardsInitial extends CageCardsState {}

class CageCardsFetch extends CageCardsState {
  CageCardsFetch(this.cageCards);

  final List<CageModel> cageCards;
}

class CageCardsLoading extends CageCardsFetch {
  CageCardsLoading(super.cageCards);
}

class CageCardsSuccess extends CageCardsFetch {
  CageCardsSuccess(super.cageCards);
}

class CageCardsEmpty extends CageCardsState {
  CageCardsEmpty(this.message);

  final String message;
}

class CageCardsFail extends CageCardsState {
  CageCardsFail(this.message);

  final String message;
}
