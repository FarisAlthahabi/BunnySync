import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_model.dart';
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeder_details_state.dart';
part 'states/general_breeder_details_state.dart';

@injectable
class BreederDetailsCubit extends Cubit<GeneralBreederDetailsState> {
  BreederDetailsCubit(
    this._breederDetailsRepo,
  ) : super(BreederDetailsInitial());

  final BreederDetailsRepo _breederDetailsRepo;

  Future<void> getBreederDetails(int breederId) async {
    emit(BreederDetailsLoading(breederDetailsResponseFakeModel));

    try {
      final response = await _breederDetailsRepo.getBreederDetails(breederId);
      emit(BreederDetailsSuccess(response.data));
    } catch (e, s) {
      addError(e, s);
      emit(BreederDetailsFail(e.toString()));
    }
  }
}
