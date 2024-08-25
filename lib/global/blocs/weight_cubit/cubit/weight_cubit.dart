import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/models/save_weight_litter_model/save_weight_litter_model.dart';
import 'package:bunny_sync/global/models/weight_post_model/weight_post_model.dart';
import 'package:bunny_sync/global/repos/weight_repo/weight_repo.dart';
import 'package:bunny_sync/global/utils/enums/entity_types.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/weight_state.dart';

part 'states/general_weight_state.dart';

@injectable
class WeightCubit extends Cubit<GeneralWeightState> {
  WeightCubit(this._weightRepo) : super(UpdateWeightInitial());

  final WeightRepo _weightRepo;

  SaveWeightLitterModel _saveWeightLitterModel = const SaveWeightLitterModel();

  WeightPostModel _weightPostModel = const WeightPostModel();

  final Map<String, double> weightsMap = {};

  void setWeightType(bool? weightType) {
    _saveWeightLitterModel = _saveWeightLitterModel.copyWith(
      weightType: () => weightType,
    );
  }

  void setWeight(String weight, EntityTypes entityType, {int? kitId}) {
    if (entityType == EntityTypes.litter) {
      dynamic value;

      if (_saveWeightLitterModel.weightType && kitId != null) {
        weightsMap["$kitId"] = double.parse(weight);
        value = weightsMap;
      } else {
        value = double.tryParse(weight);
      }

      _saveWeightLitterModel = _saveWeightLitterModel.copyWith(
        weights: () => value,
      );
    } else {
      _weightPostModel = _weightPostModel.copyWith(
        weight: () => double.tryParse(weight),
      );
    }
  }

  void setWeightDate(
    DateTime date,
    EntityTypes entityType,
  ) {
    if (entityType == EntityTypes.litter) {
      _saveWeightLitterModel = _saveWeightLitterModel.copyWith(
        date: () => date,
      );
    } else {
      _weightPostModel = _weightPostModel.copyWith(
        date: () => date,
      );
    }
  }

  Future<void> saveWeight(
    EntityTypes entityType, {
    int? litterid,
    int? kitId,
    int? weightId,
  }) async {
    emit(UpdateWeightLoading());

    try {
      if (entityType == EntityTypes.breeder) {
        await _weightRepo.updateWeight(
          entityType,
          weightId: weightId,
          weightPostModel: _weightPostModel,
        );
      } else if (entityType == EntityTypes.litter) {
        await _weightRepo.updateWeight(
          entityType,
          saveWeightLitterModel: _saveWeightLitterModel,
          litterId: litterid,
        );
      } else {
        await _weightRepo.updateWeight(
          entityType,
          saveWeightLitterModel: _saveWeightLitterModel,
          litterId: litterid,
          kitId: kitId,
        );
      }
      emit(UpdateWeightSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(UpdateWeightFail(e.toString()));
    }
  }
}
