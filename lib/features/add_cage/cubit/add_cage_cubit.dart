import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_cage/model/cage_post_model/cage_post_model.dart';
import 'package:bunny_sync/features/add_cage/repo/add_cage_repo.dart';
import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_model.dart';
import 'package:bunny_sync/global/utils/enums/answer_types_enum.dart';
import 'package:bunny_sync/global/utils/enums/cage_placement_enum.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_cage_state.dart';

part 'states/general_add_cage_state.dart';

@injectable
class AddCageCubit extends Cubit<GeneralAddCageState> {
  AddCageCubit(this._addCageRepo) : super(AddCageInitial());

  final AddCageRepo _addCageRepo;

  Set<CagePlacementTypes?> settings = {};

  CagePostModel _cagePostModel = const CagePostModel();

  void setTitle(String title) {
    _cagePostModel = _cagePostModel.copyWith(
      title: () => title,
    );
  }

  void setType(String? type) {
    _cagePostModel = _cagePostModel.copyWith(
      type: () => type,
    );
  }

  void setSize(String? size) {
    _cagePostModel = _cagePostModel.copyWith(
      size: () => size,
    );
  }

  void setOrientation(String? orientation) {
    _cagePostModel = _cagePostModel.copyWith(
      orientation: () => orientation,
    );
  }

  void setHole(AnswerTypes? hole) {
    _cagePostModel = _cagePostModel.copyWith(
      hole: () => hole,
    );
  }

  void setSettings(CagePlacementTypes? value) {
    settings.add(value);
    _cagePostModel = _cagePostModel.copyWith(
      settings: () => settings.map(toElement),
    );
  }

  Future<void> addCage() async {
    emit(AddCageLoading());

    try {
      final response = await _addCageRepo.addCage(_cagePostModel);
      emit(AddCageSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(AddCageFail(e.toString()));
    }
  }

  Future<void> updateCage(int cageId) async {
    emit(AddCageLoading());

    try {
      final response = await _addCageRepo.updateCage(
        _cagePostModel,
        cageId,
      );
      emit(UpdateCageSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(AddCageFail(e.toString()));
    }
  }
}
