import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_response_model/litter_details_response_fake_model.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/litters/models/litters_status_model/litter_status_fake_model.dart';
import 'package:bunny_sync/features/litters/models/litters_status_model/litters_status_model.dart';
import 'package:bunny_sync/features/litters/repo/litters_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/general_litters_state.dart';

part 'states/litters_state.dart';

part 'states/kits_state.dart';

part 'states/show_kits_state.dart';

@injectable
class LittersCubit extends Cubit<GeneralLittersState> {
  LittersCubit(this._littersRepo) : super(LittersInitial());

  final LittersRepo _littersRepo;

  List<LitterEntryModel> allLitters = [];

  late LittersStatusModel littersStatusModel;

  late LittersStatusModel initialLitters;

  List<LitterEntryModel> get activeLitters =>
      allLitters.where((element) => element.isActive).toList();

  List<LitterEntryModel> get inactiveLitters =>
      allLitters.where((element) => !element.isActive).toList();

  void emitShowKits(int litterId , bool showKits) {
    if(showKits){
       emit(
      ShowKitsState(
        showKits: showKits,
        litterId: litterId,
      ),
    );
    }
   
  }

  Future<void> getLitters({int? breederId}) async {
    emit(LittersLoading(fakeLittersStatusModel));

    try {
      final response = await _littersRepo.getLitters(breederId: breederId);
      if (response.litters.isEmpty) {
        emit(LittersEmpty("litters_empty".i18n));
        return;
      }

      allLitters = response.litters;

      littersStatusModel = LittersStatusModel(
        all: allLitters,
        active: activeLitters,
        inactive: inactiveLitters,
      );
      initialLitters = littersStatusModel;

      emit(LittersSuccess(littersStatusModel));
    } catch (e, s) {
      addError(e, s);
      emit(LittersFail(e.toString()));
    }
  }

  void addLitter(LitterEntryModel litterEntryModel) {
    allLitters.add(litterEntryModel);

    littersStatusModel = LittersStatusModel(
      all: allLitters,
      active: activeLitters,
      inactive: inactiveLitters,
    );

    //TODO: Updating for search state
    if (state is LittersSuccess) {
      emit(LittersSuccess(littersStatusModel));
    }
  }

  Future<void> getKits(int litterId) async {
    emit(KitsLoading(fakeKits));

    try {
      final response = await _littersRepo.getKits(litterId);
      if (response.isEmpty) {
        emit(KitsEmpty("kits_empty".i18n));
        return;
      }
      emit(KitsSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(KitsFail(e.toString()));
    }
  }
}
