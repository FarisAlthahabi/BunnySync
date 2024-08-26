import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/weight/models/weightable_model/weightable_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/weight_model/weight_model.dart';
import 'package:bunny_sync/global/repos/weight_repo/weight_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/get_all_weights_state.dart';

part 'states/general_weight_state.dart';

@injectable
class WeightCubit extends Cubit<GeneralWeightState> {
  WeightCubit(this._weightRepo) : super(WeightInitial());

  final WeightRepo _weightRepo;

  Future<void> getEntityWeights(WeightableModel weightableModel) async {
    emit(GetAllWeightsLoading());

    try {
      final response = await _weightRepo.getEntityWeights(
        weightableModel,
      );

      if (response.isEmpty) {
        emit(GetAllWeightsEmpty("no_weights".i18n));
      } else {
        emit(GetAllWeightsSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(GetAllWeightsFail(e.toString()));
    }
  }
}
