part of '../delete_breeder_cubit.dart';

@immutable
sealed class DeleteBreederState extends GeneralDeleteBreederState {}

final class DeleteBreederInitial extends DeleteBreederState {}

final class DeleteBreederLoading extends DeleteBreederState {}

final class DeleteBreederSuccess extends DeleteBreederState {
  DeleteBreederSuccess({required this.breeder});

  final BreederEntryModel breeder;
}

final class DeleteBreederFail extends DeleteBreederState {
  DeleteBreederFail(this.message);

  final String message;
}
