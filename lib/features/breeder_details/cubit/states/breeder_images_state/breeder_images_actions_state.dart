part of '../../breeder_details_cubit.dart';

class BreederImagesActionsState extends GeneralBreederDetailsState {}

class BreederImageAddLoading extends BreederImagesActionsState {
  BreederImageAddLoading();
}

class BreederImageAddSuccess extends BreederImagesActionsState {
  BreederImageAddSuccess();
}

class BreederImageDeleteSuccess extends BreederImagesActionsState {
  BreederImageDeleteSuccess();
}

class BreederImageDeleteFail extends BreederImagesActionsState {
  BreederImageDeleteFail(this.message);

  final String message;
}

class BreederImageAddFail extends BreederImagesActionsState {
  BreederImageAddFail(this.message);

  final String message;
}
