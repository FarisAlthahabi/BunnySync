import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/weight/models/weightable_model/weightable_model.dart';
import 'package:bunny_sync/global/models/weight_post_model/weight_post_model.dart';
import 'package:bunny_sync/global/repos/weight_repo/weight_repo.dart';
import 'package:bunny_sync/global/utils/enums/entity_types.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_weight_state.dart';

part 'states/general_add_weight_state.dart';

part 'states/set_litter_weight_type_state.dart';

@injectable
class AddWeightCubit extends Cubit<GeneralAddWeightState> {
  AddWeightCubit(this._weightRepo) : super(AddWeightInitial());

  final WeightRepo _weightRepo;

  WeightPostModel _weightPostModel = const WeightPostModel();

  final Map<String, double> weightsMap = {};

  void setWeightType(bool? weightType) {
    if (weightType == null) return;

    _weightPostModel = _weightPostModel.copyWith(
      weightType: () => weightType,
    );

    emit(SetLitterWeightTypeState(isIndividualKits: weightType));
  }

  void setWeight(String weight, EntityTypes entityType, {int? kitId}) {
    if (entityType == EntityTypes.litter) {
      dynamic value;

      if (_weightPostModel.weightType && kitId != null) {
        weightsMap["$kitId"] = double.parse(weight);
        value = weightsMap;
      } else {
        value = double.tryParse(weight);
      }

      _weightPostModel = _weightPostModel.copyWith(
        weights: () => value,
      );
    } else {
      _weightPostModel = _weightPostModel.copyWith(
        weights: () => double.tryParse(weight),
      );
    }
  }

  void setWeightDate(
    DateTime date,
    EntityTypes entityType,
  ) {
    if (entityType == EntityTypes.litter) {
      _weightPostModel = _weightPostModel.copyWith(
        date: () => date,
      );
    } else {
      _weightPostModel = _weightPostModel.copyWith(
        date: () => date,
      );
    }
  }

  Future<void> saveWeight(WeightableModel weightableModel) async {
    emit(AddWeightLoading());

    try {
      await _weightRepo.addWeight(weightableModel, _weightPostModel);
      emit(AddWeightSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(AddWeightFail(e.toString()));
    }
  }
}
