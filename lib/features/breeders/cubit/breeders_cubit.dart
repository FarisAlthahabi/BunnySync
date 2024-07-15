import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_litter/model/add_litter_model/add_litter_model.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_gender_model/breeders_gender_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_model/fake_breeders_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_status_model/breeder_status_model.dart';
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeders_state.dart';

part 'states/general_breeders_state.dart';

part 'states/search_breeder_state.dart';

@injectable
class BreedersCubit extends Cubit<GeneralBreedersState> {
  BreedersCubit(this._breedersRepo) : super(GeneralBreedersInitial());

  final BreedersRepo _breedersRepo;

  List<BreederEntryModel> allBreeders = [];

  List<BreederEntryModel> searchedBreeders = [];

  late BreedersStatusModel breedersStatusModel;

  late BreedersGenderModel breedersGenderModel;

  late BreedersStatusModel initailBreeders;

  List<BreederEntryModel> get activeBreeders =>
      allBreeders.where((element) => element.isActive).toList();

  List<BreederEntryModel> get inactiveBreeders =>
      allBreeders.where((element) => !element.isActive).toList();

  List<BreederEntryModel> get maleBreeders => allBreeders
      .where((element) => element.gender == GenderTypes.male)
      .toList();

  List<BreederEntryModel> get femaleBreeders => allBreeders
      .where((element) => element.gender == GenderTypes.female)
      .toList();

  // void setLittersCount(int? littersCount) {
  //   breederEntryModel = breederEntryModel.copyWith(
  //     littersCount: () => littersCount,
  //   );
  // }

  // void setkitsCount(int? kitsCount) {
  //   breederEntryModel = breederEntryModel.copyWith(
  //     kitsCount: () => kitsCount,
  //   );
  // }

  Future<void> getBreeders() async {
    emit(BreedersLoading(fakeBreedersStatusModel));
    try {
      final response = await _breedersRepo.getBreeders();

      allBreeders = response.breeders;

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
        searchedBreeders = [];
        emit(BreedersSuccess(initailBreeders));
      } else {
        emit(SearchBreederLoading());
        final response = await _breedersRepo.getSearchedBreeders(input);
        searchedBreeders = response.breeders;
        if (searchedBreeders.isEmpty) {
          emit(SearchBreederNotFound('breeder_not_found'.i18n));
        } else {
          emit(SearchBreederSuccess(searchedBreeders));
        }
      }
    } catch (e, s) {
      addError(e, s);
      emit(SearchBreederFail(e.toString()));
    }
  }

  void addBreeder(BreederEntryModel breederEntryModel) {
    activeBreeders.add(breederEntryModel);
    allBreeders.add(breederEntryModel);
    breedersStatusModel = BreedersStatusModel(
      all: allBreeders,
      active: activeBreeders,
      inactive: inactiveBreeders,
    );

    if (state is SearchBreederSuccess) {
      emit(SearchBreederSuccess(searchedBreeders));
    } else {
      emit(BreedersSuccess(breedersStatusModel));
    }
  }

  void updateBreeder(BreederEntryModel breederEntryModel) {
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

  void addLitter(AddLitterModel addLitterModel) {
    if (state is SearchBreederSuccess) {
      emit(SearchBreederSuccess(searchedBreeders));
    } else if (state is BreedersSuccess) {
      emit(BreedersSuccess(breedersStatusModel));
    }
  }

  void deleteBreeder(int breederId) {
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

  Future<void> getBreedersByGender() async {
    emit(BreedersLoading(fakeBreedersStatusModel));
    try {
      final response = await _breedersRepo.getBreeders();

      allBreeders = response.breeders;

      breedersGenderModel = BreedersGenderModel(
        maleBreeders: maleBreeders,
        femaleBreeders: femaleBreeders,
      );

      emit(BreedersByGenderSuccess(breedersGenderModel));
    } catch (e, s) {
      addError(e, s);
      emit(BreedersFail(e.toString()));
    }
  }
}
