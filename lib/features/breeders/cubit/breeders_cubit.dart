import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeders/models/breeders_model/breeders_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_model/fake_breeders_model.dart';
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeders_state.dart';

part 'states/general_breeders_state.dart';

@injectable
class BreedersCubit extends Cubit<GeneralBreedersState> {
  BreedersCubit(this._breedersRepo) : super(BreedersInitial());

  final BreedersRepo _breedersRepo;

  Future<void> getBreeders() async {
    emit(BreedersLoading(fakeBreedersModel));
    try {
      final response = await _breedersRepo.getBreeders();
      emit(BreedersSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(BreedersFail(e.toString()));
    }
  }
}
