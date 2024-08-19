part of '../upload_file_cubit.dart';

@immutable
sealed class UploadFileState extends GeneralUploadFileState {}

final class UploadFileInitial extends UploadFileState {}

final class UploadFileLoading extends UploadFileState {}

final class UploadFileSuccess extends UploadFileState {
  UploadFileSuccess(this.filePath);

  final String? filePath;
}

final class UploadFileFail extends UploadFileState {
  UploadFileFail(this.message);

  final String message;
}
