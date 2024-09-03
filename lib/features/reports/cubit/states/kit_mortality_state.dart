part of '../reports_cubit.dart';

@immutable
abstract class KitMortalityState extends GeneralReportsState {}

class KitMortalityInitial extends KitMortalityState {}

class KitMortalityFetch extends KitMortalityState {
  KitMortalityFetch(this.kitMortality);

  final List<KitMortalityModel> kitMortality;
}

class KitMortalityLoading extends KitMortalityFetch {
  KitMortalityLoading(super.kitMortality);
}

class KitMortalitySuccess extends KitMortalityFetch {
  KitMortalitySuccess(super.kitMortality);
}

class KitMortalityEmpty extends KitMortalityState {
  KitMortalityEmpty(this.message);

  final String message;
}

class KitMortalityFail extends KitMortalityState {
  KitMortalityFail(this.message);

  final String message;
}
