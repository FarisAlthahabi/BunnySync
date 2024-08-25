import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_response_model/litter_details_response_fake_model.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_response_model/litter_details_response_model.dart';
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/delete_kit_state.dart';

part 'states/litter_details_state.dart';

part 'states/general_litter_details_state.dart';

@injectable
class LitterDetailsCubit extends Cubit<GeneralLitterDetailsState> {
  LitterDetailsCubit(
    this._litterDetailsRepo,
    @factoryParam this.litter,
  ) : super(LitterDetailsInitial());

  LitterEntryModel litter;

  final LitterDetailsRepo _litterDetailsRepo;

  LitterDetailsResponseModel? litterDetailsResponseModel;

  Future<void> getLitterEntry() async {
    emit(LitterEntrySuccess(litter));
  }

  Future<void> getLitterDetails(int id) async {
    emit(LitterDetailsLoading(litterDetailsResponseFakeModel));
    try {
      final response = await _litterDetailsRepo.getLitterDetails(id);
      litterDetailsResponseModel = response;
      emit(LitterDetailsSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(LitterDetailsFail(e.toString()));
    }
  }

  void addKit(KitModel kit) {
    litterDetailsResponseModel = litterDetailsResponseModel?.copyWith(
      litter: litterDetailsResponseModel?.litter.copyWith(
        kits: [...litterDetailsResponseModel?.litter.kits ?? [], kit],
      ),
    );

    if (litterDetailsResponseModel != null) {
      emit(LitterDetailsSuccess(litterDetailsResponseModel!));
    }
  }

  void updateKit(KitModel kit) {
    final updatedKits = litterDetailsResponseModel?.litter.kits.map((e) {
      if (e.id == kit.id) {
        return kit;
      }
      return e;
    }).toList();

    litterDetailsResponseModel = litterDetailsResponseModel?.copyWith(
      litter: litterDetailsResponseModel?.litter.copyWith(
        kits: updatedKits,
      ),
    );

    if (litterDetailsResponseModel != null) {
      emit(LitterDetailsSuccess(litterDetailsResponseModel!));
    }
  }

  Future<void> deleteKit({required int litterId, required int kitId}) async {
    try {
      await _litterDetailsRepo.deleteKit(
        litterId: litterId,
        kitId: kitId,
      );

      final updatedKits = litterDetailsResponseModel?.litter.kits
          .where((element) => element.id != kitId)
          .toList();

      litterDetailsResponseModel = litterDetailsResponseModel?.copyWith(
        litter: litterDetailsResponseModel?.litter.copyWith(
          kits: updatedKits,
        ),
      );

      emit(DeleteKitState(litterId: litterId, kitId: kitId));
      if (litterDetailsResponseModel != null) {
        emit(LitterDetailsSuccess(litterDetailsResponseModel!));
      }
    } catch (e, s) {
      addError(e, s);
      emit(LitterDetailsFail(e.toString()));
    }
  }
}
