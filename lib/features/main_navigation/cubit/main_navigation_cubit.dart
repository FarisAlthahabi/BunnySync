import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'main_navigation_state.dart';

@injectable
class MainNavigationCubit extends Cubit<MainNavigationState> {
  MainNavigationCubit() : super(MainNavigationInitial());

  void addBreeder(BreederEntryModel breederEntryModel) {
    emit(BreederAdded(breederEntryModel));
  }

  void updateBreeder(BreederEntryModel breederEntryModel) {
    emit(BreederUpdated(breederEntryModel));
  }

  void deleteBreeder(BreederEntryModel breederEntryModel) {
    emit(BreederDeleted(breederEntryModel));
  }
}
