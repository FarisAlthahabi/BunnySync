import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_response_model/litter_details_response_fake_model.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_response_model/litter_details_response_model.dart';
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

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

  Future<void> getLitterEntry() async {
    emit(LitterEntrySuccess(litter));
  }

  Future<void> getLitterDetails(int id) async {
    emit(LitterDetailsLoading(litterDetailsResponseFakeModel));
    try {
      final response = await _litterDetailsRepo.getLitterDetails(id);
      emit(LitterDetailsSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(LitterDetailsFail(e.toString()));
    }
  }
}
