import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_model/fake_breeders_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_status_model/breeder_status_model.dart';
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart';
import 'package:bunny_sync/global/localization/strings.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeders_state.dart';

part 'states/general_breeders_state.dart';

part 'states/search_breeder_state.dart';

@injectable
class BreedersCubit extends Cubit<GeneralBreedersState> {
  BreedersCubit(this._breedersRepo) : super(GeneralBreedersInitial());

  final BreedersRepo _breedersRepo;

  List<BreederEntryModel> activeBreeders = [];

  List<BreederEntryModel> inactiveBreeders = [];

  List<BreederEntryModel> allBreeders = [];

  List<BreederEntryModel> searchedBreeders = [];

  late BreedersStatusModel breedersStatusModel;

  late BreedersStatusModel initailBreeders;

  Future<void> getBreeders() async {
    emit(BreedersLoading(fakeBreedersStatusModel));
    try {
      final response = await _breedersRepo.getBreeders();
      allBreeders = response.breeders;
      for (final element in allBreeders) {
        if (element.status == 'active') {
          activeBreeders.add(element);
        } else if (element.status == 'inactive') {
          inactiveBreeders.add(element);
        }
      }

      breedersStatusModel = BreedersStatusModel(
        all: allBreeders,
        active: activeBreeders,
        inactive: inactiveBreeders,
      );
      initailBreeders = breedersStatusModel;
      emit(BreedersSuccess(breedersStatusModel));
    } catch (e, s) {
      addError(e, s);
      emit(BreedersFail(e.toString()));
    }
  }

  Future<void> getSearchedBreeders(String breederName) async {
    try {
      if (breederName.isEmpty) {
        emit(BreedersSuccess(initailBreeders));
      } else {
        emit(SearchBreederLoading());
        final response = await _breedersRepo.getSearchedBreeders(breederName);
        searchedBreeders = response.breeders;
        if (searchedBreeders.isEmpty) {
          emit(SearchBreederNotFound(Strings.breederNotFound));
        } else {
          emit(SearchBreederSuccess(searchedBreeders));
        }
      }
    } catch (e, s) {
      addError(e, s);
      emit(SearchBreederFail(e.toString()));
    }
  }
}
