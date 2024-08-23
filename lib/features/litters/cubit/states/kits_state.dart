part of '../litters_cubit.dart';

@immutable
abstract class KitsState extends GeneralLittersState {}

class KitsInitial extends KitsState {}

class KitsFetch extends KitsState {
  KitsFetch(this.kits);

  final List<KitModel> kits;
}

class KitsLoading extends KitsFetch {
  KitsLoading(super.kits);
}

class KitsSuccess extends KitsFetch {
  KitsSuccess(super.kits);
}

class KitsFail extends KitsState {
  KitsFail(this.message);

  final String message;
}

class KitsEmpty extends KitsState {
  KitsEmpty(this.message);

  final String message;
}
