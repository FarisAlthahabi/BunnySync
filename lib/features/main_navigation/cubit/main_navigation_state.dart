part of 'main_navigation_cubit.dart';

@immutable
sealed class MainNavigationState {}

final class MainNavigationInitial extends MainNavigationState {}

final class BreederUpdated extends MainNavigationState {
  BreederUpdated(this.breederEntryModel);

  final BreederEntryModel breederEntryModel;
}
