import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeders/models/breeder_model/breeder_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_model/fake_breeders_model.dart';
import 'package:bunny_sync/features/breeders/models/breeders_status_model/breeder_status_model.dart';
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeders_state.dart';

part 'states/general_breeders_state.dart';

@injectable
class BreedersCubit extends Cubit<GeneralBreedersState> {
  BreedersCubit(this._breedersRepo) : super(BreedersInitial());

  final BreedersRepo _breedersRepo;

  List<BreederModel> activeBreeders = [];
  List<BreederModel> inactiveBreeders = [];
  List<BreederModel> allBreeders = [];

  late BreedersStatusModel breedersStatusModel;

  Future<void> getBreeders() async {
    emit(BreedersLoading(fakeBreedersStatusModel));
    try {
      final response = await _breedersRepo.getBreeders();
      allBreeders = response.breeders;

      for (final element in allBreeders) {
        if (element.status == 'active') {
          activeBreeders.add(element);
        } else if(element.status == 'inactive'){
          inactiveBreeders.add(element);
        }
      }

      breedersStatusModel = BreedersStatusModel(
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
}
