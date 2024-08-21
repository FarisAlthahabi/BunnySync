part of '../add_attachment_cubit.dart';

@immutable
abstract class AddAttachmentState extends GeneralAddAttachmentState {}

class AddAttachmentInitial extends AddAttachmentState {}

class AddAttachmentLoading extends AddAttachmentState {}

class AddAttachmentSuccess extends AddAttachmentState {
  AddAttachmentSuccess(this.attachmentModel);

  final AttachmentModel attachmentModel;
}

class UpdateAttachmentSuccess extends AddAttachmentState {
  UpdateAttachmentSuccess(this.attachmentModel);

  final AttachmentModel attachmentModel;
}

class AddAttachmentFail extends AddAttachmentState {
  AddAttachmentFail(this.message);

  final String message;
}
