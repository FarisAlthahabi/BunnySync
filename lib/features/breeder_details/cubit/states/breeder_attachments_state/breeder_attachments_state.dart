part of '../../breeder_details_cubit.dart';

@immutable
abstract class BreederAttachmentsState extends GeneralBreederDetailsState {}

class BreederAttachmentsInitial extends BreederAttachmentsState {}

class BreederAttachmentsFetch extends BreederAttachmentsState {
  BreederAttachmentsFetch(this.breederAttachments);

  final List<AttachmentModel> breederAttachments;
}

class BreederAttachmentsLoading extends BreederAttachmentsFetch {
  BreederAttachmentsLoading(super.breederAttachments);
}

class BreederAttachmentsSuccess extends BreederAttachmentsFetch {
  BreederAttachmentsSuccess(super.breederAttachments);
}

class BreederAttachmentsEmpty extends BreederAttachmentsState {
  BreederAttachmentsEmpty(this.message);

  final String message;
}

class BreederAttachmentsFail extends BreederAttachmentsState {
  BreederAttachmentsFail(this.message);

  final String message;
}
