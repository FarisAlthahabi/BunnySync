part of '../add_cage_cubit.dart';

class SetCagePlacementTypeState extends GeneralAddCageState {
  SetCagePlacementTypeState({
    required this.length,
    this.settings = const [],
  });

  final int length;
  final List<CagePlacementTypes> settings;
}
