import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_ailment/model/ailment_post_model/ailment_post_model.dart';
import 'package:bunny_sync/features/add_ailment/repo/add_ailment_repo.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_ailment_state.dart';

part 'states/general_add_ailment_state.dart';

@injectable
class AddAilmentCubit extends Cubit<GeneralAddAilmentState> {
  AddAilmentCubit(this._addAilmentRepo) : super(AddAilmentInitial());

  final AddAilmentRepo _addAilmentRepo;

  AilmentPostModel _ailmentPostModel = const AilmentPostModel();

  void setType(String? type) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      type: () => type,
    );
  }

  void setBreederId(int? breederId) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      breederId: () => breederId,
    );
  }

  void setKitId(int? kitId) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      kitId: () => kitId,
    );
  }

  void setTitle(String? title) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      title: () => title,
    );
  }

  void setSymptoms(String? symptoms) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      symptoms: () => symptoms,
    );
  }

  void setStartDate(DateTime? startDate) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      startDate: () => startDate,
    );
  }

  void setStatus(String? status) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      status: () => status,
    );
  }

  void setNote(String? note) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      note: () => note,
    );
  }

  Future<void> addAilment() async {
    emit(AddAilmentLoading());

    try {
      final ailment = await _addAilmentRepo.addAilment(_ailmentPostModel);
      emit(AddAilmentSuccess(ailment));
    } catch (e, s) {
      addError(e, s);
      emit(AddAilmentFail(e.toString()));
    }
  }

  Future<void> updateAilment(int ailmentId) async {
    emit(AddAilmentLoading());

    try {
      final ailment = await _addAilmentRepo.updateAilment(
        _ailmentPostModel,
        ailmentId,
      );
      emit(UpdateAilmentSuccess(ailment));
    } catch (e, s) {
      addError(e, s);
      emit(AddAilmentFail(e.toString()));
    }
  }
}
