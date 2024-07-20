part of '../breeder_details_cubit.dart';

@immutable
abstract class BreederImagesState extends GeneralBreederDetailsState {}

class BreederImagesInitial extends BreederImagesState {}

class BreederImagesFetch extends BreederImagesState {
  BreederImagesFetch(this.breederImages);

  final List<BreederImageModel> breederImages;
}

class BreederImagesLoading extends BreederImagesFetch {
  BreederImagesLoading(super.breederImages);
}

class BreederImagesSuccess extends BreederImagesFetch {
  BreederImagesSuccess(super.breederImages);
}

class BreederImageAddSuccess extends BreederImagesState {
  BreederImageAddSuccess(this.breederImageModel);

  final BreederImageModel breederImageModel;
}

class BreederImagesEmpty extends BreederImagesState {
  BreederImagesEmpty(this.message);

  final String message;
}

class BreederImagesFail extends BreederImagesState {
  BreederImagesFail(this.message);

  final String message;
}

class BreederImageAddFail extends BreederImagesState {
  BreederImageAddFail(this.message);

  final String message;
}
