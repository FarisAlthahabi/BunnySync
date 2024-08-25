import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/kits_state.dart';

part 'states/add_kit_state.dart';

part 'states/update_kit_state.dart';

@injectable
class KitsCubit extends Cubit<GeneralKitsState> {
  KitsCubit() : super(KitsInitial());

  void addKit(KitModel kit, int litterId) {
    emit(AddKitState(kit: kit, litterId: litterId));
  }

  void updateKit(KitModel kit) {
    emit(UpdateKitState(kit: kit));
  }
}
