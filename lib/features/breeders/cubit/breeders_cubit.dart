import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_litter/model/add_litter_model/add_litter_model.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_gender_model/breeders_gender_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_model/fake_breeders_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_status_model/breeder_status_model.dart';
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart';
import 'package:bunny_sync/features/litter_details/model/breeder_pair_model/breeder_pair_model.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeders_state.dart';
part 'states/general_breeders_state.dart';
part 'states/search_breeder_state.dart';
part 'states/breeder_pairs_state.dart';

@injectable
class BreedersCubit extends Cubit<GeneralBreedersState> {
  BreedersCubit(this._breedersRepo) : super(GeneralBreedersInitial());

  final BreedersRepo _breedersRepo;

  List<BreederEntryModel> allBreeders = [];

  List<BreederEntryModel> searchedBreeders = [];

  BreedersStatusModel? _breedersStatusModel;

  BreedersStatusModel get breedersStatusModel =>
      _breedersStatusModel ?? BreedersStatusModel.empty();

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

  List<BreederEntryModel> get activeMaleBreeders =>
      maleBreeders.where((element) => element.isActive).toList();

  List<BreederEntryModel> get activeFemaleBreeders =>
      femaleBreeders.where((element) => element.isActive).toList();

  List<BreederEntryModel> get inactiveMaleBreeders =>
      maleBreeders.where((element) => !element.isActive).toList();

  List<BreederEntryModel> get inactiveFemaleBreeders =>
      femaleBreeders.where((element) => !element.isActive).toList();

  late BreedersGenderModel breedersGenderModel;

  Future<void> getBreeders() async {
    if (_breedersStatusModel != null) {
      emit(BreedersSuccess(breedersStatusModel));
      return;
    }

    emit(BreedersLoading(fakeBreedersStatusModel));
    try {
      final response = await _breedersRepo.getBreeders();

      allBreeders = response.breeders;

      _breedersStatusModel = BreedersStatusModel(
        all: allBreeders,
        active: activeBreeders,
        inactive: inactiveBreeders,
      );
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
        emit(BreedersSuccess(breedersStatusModel));
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
    allBreeders.add(breederEntryModel);

    _breedersStatusModel = BreedersStatusModel(
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

    _breedersStatusModel = BreedersStatusModel(
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

  void setBreederButchered(int breederId) {
    activeBreeders.removeWhere(
      (element) => element.id == breederId,
    );
    for (final element in allBreeders) {
      if (element.id == breederId) {
        inactiveBreeders.add(element);
      }
    }
    _breedersStatusModel = BreedersStatusModel(
      all: allBreeders,
      active: activeBreeders,
      inactive: inactiveBreeders,
    );
    if(state is BreedersSuccess){
    emit(BreedersSuccess(breedersStatusModel));
    }else if(state is SearchBreederSuccess){
      emit(SearchBreederSuccess(searchedBreeders));
    }
  }

  void addLitter(AddLitterModel addLitterModel) {
    allBreeders = allBreeders.map((e) {
      if (e.id == addLitterModel.femaleBreederId ||
          e.id == addLitterModel.maleBreederId) {
        final litters = num.tryParse(e.litters ?? '');

        return e.copyWith(
          litters: litters != null ? (litters + 1).toString() : '1',
        );
      }
      return e;
    }).toList();

    _breedersStatusModel = BreedersStatusModel(
      all: allBreeders,
      active: activeBreeders,
      inactive: inactiveBreeders,
    );

    searchedBreeders = searchedBreeders.map((e) {
      if (e.id == addLitterModel.femaleBreederId ||
          e.id == addLitterModel.maleBreederId) {
        final litters = num.tryParse(e.litters ?? '');

        return e.copyWith(
          litters: litters != null ? (litters + 1).toString() : '1',
        );
      }
      return e;
    }).toList();

    if (state is SearchBreederSuccess) {
      emit(SearchBreederSuccess(searchedBreeders));
    } else if (state is BreedersSuccess) {
      emit(BreedersSuccess(breedersStatusModel));
    }
  }

  void deleteBreeder(int breederId) {
    allBreeders =
        allBreeders.where((element) => element.id != breederId).toList();
    _breedersStatusModel = BreedersStatusModel(
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

  Future<void> getBreedersByAllGenders() async {
    emit(BreedersLoading(fakeBreedersStatusModel));
    try {
      final response = await _breedersRepo.getBreeders();

      allBreeders = response.breeders;

      breedersGenderModel = BreedersGenderModel(
        maleBreeders: maleBreeders,
        femaleBreeders: femaleBreeders,
      );
      if (maleBreeders.isEmpty) {
        emit(MaleBreedersEmpty("male_breeders_empty"));
      }
      if (femaleBreeders.isEmpty) {
        emit(FemaleBreedersEmpty("female_breeders_empty"));
      }

      emit(BreedersByGenderSuccess(breedersGenderModel));
    } catch (e, s) {
      addError(e, s);
      emit(BreedersFail(e.toString()));
    }
  }

  Future<void> getBreedersByGender(GenderTypes gender) async {
    emit(BreedersLoading(fakeBreedersStatusModel));
    try {
      var result = breedersStatusModel;

      if (gender.isMale) {
        result = breedersStatusModel.copyWith(
          all: maleBreeders,
          active: activeMaleBreeders,
          inactive: inactiveMaleBreeders,
        );
      } else if (gender.isFemale) {
        result = breedersStatusModel.copyWith(
          all: femaleBreeders,
          active: activeFemaleBreeders,
          inactive: inactiveFemaleBreeders,
        );
      }

      emit(BreedersSuccess(result));
    } catch (e, s) {
      addError(e, s);
      emit(BreedersFail(e.toString()));
    }
  }

  Future<void> getBreederPairs() async {
    emit(BreederPairsLoading());
    try {
      final response = await _breedersRepo.getBreederPairs();
      if (response.isEmpty) {
        emit(
          BreederPairsEmpty("no_breeder_pairs"),
        );
      } else {
        emit(BreederPairsSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(BreederPairsFail(e.toString()));
    }
  }
}
