part of '../kits_cubit.dart';

@immutable
class AddKitState extends GeneralKitsState {
  AddKitState({required this.litterId, required this.kit});

  final int litterId;
  final KitModel kit;
}
