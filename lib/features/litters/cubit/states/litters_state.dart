part of '../litters_cubit.dart';

@immutable
abstract class LittersState extends GeneralLittersState {}

class LittersInitial extends LittersState {}

class LittersFetch extends LittersState {
  LittersFetch(this.littersStatusModel);

  final LittersStatusModel littersStatusModel;
}

class LittersLoading extends LittersFetch {
  LittersLoading(super.littersStatusModel);
}

class LittersSuccess extends LittersFetch {
  LittersSuccess(super.littersStatusModel);
}

class LittersFail extends LittersState {
  LittersFail(this.message);

  final String message;
}

class LittersEmpty extends LittersState {
  LittersEmpty(this.message);

  final String message;
}
