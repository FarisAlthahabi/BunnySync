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

  Future<void> getSearchedBreeders(String input) async {
    try {
      if (input.isEmpty) {
        emit(BreedersSuccess(initailBreeders));
      } else {
        emit(SearchBreederLoading());
        final response = await _breedersRepo.getSearchedBreeders(input);
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

  void updateBreeder(BreederEntryModel breederEntryModel) {
    activeBreeders = activeBreeders.map((e) {
      if (e.id == breederEntryModel.id) {
        return breederEntryModel;
      }
      return e;
    }).toList();

    inactiveBreeders = inactiveBreeders.map((e) {
      if (e.id == breederEntryModel.id) {
        return breederEntryModel;
      }
      return e;
    }).toList();

    allBreeders = allBreeders.map((e) {
      if (e.id == breederEntryModel.id) {
        return breederEntryModel;
      }
      return e;
    }).toList();

    breedersStatusModel = BreedersStatusModel(
      all: allBreeders,
      active: activeBreeders,
      inactive: inactiveBreeders,
    );

    searchedBreeders = searchedBreeders.map((e) {
      if (e.id == breederEntryModel.id) {
        return breederEntryModel;
      }
      return e;
    }).toList();

    if (state is SearchBreederSuccess) {
      emit(SearchBreederSuccess(searchedBreeders));
    } else if (state is BreedersSuccess) {
      emit(BreedersSuccess(breedersStatusModel));
    }
  }

  void deleteBreederLocally(int breederId) {
    activeBreeders =
        activeBreeders.where((element) => element.id != breederId).toList();
    inactiveBreeders =
        inactiveBreeders.where((element) => element.id != breederId).toList();
    allBreeders =
        allBreeders.where((element) => element.id != breederId).toList();
    breedersStatusModel = BreedersStatusModel(
      all: allBreeders,
      active: activeBreeders,
      inactive: inactiveBreeders,
    );

    searchedBreeders =
        searchedBreeders.where((element) => element.id != breederId).toList();

    if (state is SearchBreederSuccess) {
      emit(SearchBreederSuccess(searchedBreeders));
    } else {
      emit(BreedersSuccess(breedersStatusModel));
    }
  }
}
