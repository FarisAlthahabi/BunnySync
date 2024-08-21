part of '../litters_cubit.dart';

class ShowKitsState extends GeneralLittersState {
  ShowKitsState({required this.showKits, this.litterId});

  final int? litterId;
  final bool showKits;
}
