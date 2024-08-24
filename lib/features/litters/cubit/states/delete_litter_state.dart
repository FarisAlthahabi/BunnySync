part of '../litters_cubit.dart';

@immutable
sealed class DeleteLitterState extends GeneralLittersState {}

final class DeleteLitterInitial extends DeleteLitterState {}

final class DeleteLitterLoading extends DeleteLitterState {}

final class DeleteLitterSuccess extends DeleteLitterState {}

final class DeleteLitterFail extends DeleteLitterState {
  DeleteLitterFail(this.message);

  final String message;
}
