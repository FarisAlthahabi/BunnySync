import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_ailment/model/ailment_post_model/ailment_post_model.dart';
import 'package:bunny_sync/features/add_ailment/model/ailment_types/ailment_status_types.dart';
import 'package:bunny_sync/features/add_ailment/repo/add_ailment_repo.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/enums/rabbit_types.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_ailment_state.dart';

part 'states/general_add_ailment_state.dart';

part 'states/set_selected_status_state.dart';

part 'states/show_rabbit_type_state.dart';

part 'states/show_select_kit_state.dart';

@injectable
class AddAilmentCubit extends Cubit<GeneralAddAilmentState> {
  AddAilmentCubit(this._addAilmentRepo) : super(AddAilmentInitial());

  final AddAilmentRepo _addAilmentRepo;

  AilmentPostModel _ailmentPostModel = const AilmentPostModel();

  void setType(RabbitTypes? type) {
    if (type == null) {
      emit(AddAilmentFail('rabbit_type_null'.i18n));
      return;
    }

    String result;

    ///on represent of create ailment for kits
    if (type.isBreeder == true) {
      result = 'off';
    } else {
      result = 'on';
    }

    _ailmentPostModel = _ailmentPostModel.copyWith(
      type: () => result,
    );

    emit(ShowRabbitTypeState(type));

    if (type.isBreeder == true) {
      setKitId(null);
      emit(ShowSelectKitState(showSelectKit: false));
    }
  }

  void setBreederId(int? breederId) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      breederId: () => breederId,
      kitId: () => null,
    );
  }

  BreederEntryModel? getSelectedBreeder(List<BreederEntryModel> breeders) {
    return breeders.firstWhereOrNull(
      (element) => element.id == _ailmentPostModel.breederId,
    );
  }

  void setLitter(int litterId, {VoidCallback? onSuccess}) {
    emit(ShowSelectKitState(showSelectKit: true, litterId: litterId));

    onSuccess?.call();
  }

  LitterEntryModel? getSelectedLitter(List<LitterEntryModel> litters) {
    return litters.firstWhereOrNull(
      (element) => element.allKits.any((e) => e.id == _ailmentPostModel.kitId),
    );
  }

  void setKitId(int? kitId) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      breederId: () => null,
      kitId: () => kitId,
    );
  }

  KitModel? getSelectedKit(List<KitModel> kits) {
    return kits.firstWhereOrNull(
      (element) => element.id == _ailmentPostModel.kitId,
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

  void setStatus(AilmentStatusTypes? status) {
    _ailmentPostModel = _ailmentPostModel.copyWith(
      status: () => status,
    );

    emit(SetSelectedStatusState(status));
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
