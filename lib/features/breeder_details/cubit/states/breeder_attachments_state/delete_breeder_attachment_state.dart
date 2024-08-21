part of '../../breeder_details_cubit.dart';

class DeleteBreederAttachmentState extends GeneralBreederDetailsState {}

class DeleteBreederAttachmentLoading extends DeleteBreederAttachmentState {}

class DeleteBreederAttachmentSuccess extends DeleteBreederAttachmentState {}

class DeleteBreederAttachmentFail extends DeleteBreederAttachmentState {
  DeleteBreederAttachmentFail(this.message);

  final String message;
}
