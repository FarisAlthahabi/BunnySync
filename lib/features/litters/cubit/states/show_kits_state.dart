part of '../litters_cubit.dart';

class ShowKitsState extends GeneralLittersState{}

class ShowKitsSuccessState extends ShowKitsState {
  ShowKitsSuccessState({required this.showKits});
  final bool showKits;
}
