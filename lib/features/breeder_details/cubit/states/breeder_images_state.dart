part of '../breeder_details_cubit.dart';
 
@immutable
abstract class BreederImagesState extends GeneralBreederDetailsState {}

class BreederImagesInitial extends BreederImagesState {}

class BreederImagesFetch extends BreederImagesState {
BreederImagesFetch(this.breederImages);
// Todo fix model here to list of breeder image model
 final List<BreederNoteModel> breederImages;
}

class BreederImagesLoading extends BreederImagesFetch {
  BreederImagesLoading(super.breederImages);
}

class BreederImagesSuccess extends BreederImagesFetch {
  BreederImagesSuccess(super.breederImages);
}

class BreederImagesEmpty extends BreederImagesState {
  BreederImagesEmpty(this.message);

  final String message;
}


class BreederImagesFail extends BreederImagesState {
  BreederImagesFail(this.message);

  final String message;
}
