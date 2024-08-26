import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_kit/models/post_kit_model/post_kit_model.dart';
import 'package:bunny_sync/features/add_kit/repo/add_kit_repo.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_kit_state.dart';

part 'states/general_add_kit_state.dart';

@injectable
class AddKitCubit extends Cubit<GeneralAddKitState> {
  AddKitCubit(this._addKitRepo) : super(AddKitInitial());

  final AddKitRepo _addKitRepo;

  PostKitModel _postKitModel = const PostKitModel();

  void setKitModel(KitModel kitModel) {
    _postKitModel = kitModel.toPostKitModel;
  }

  void setTatto(String tatto) {
    _postKitModel = _postKitModel.copyWith(tatto: tatto);
  }

  void setPrefix(String prefix) {
    _postKitModel = _postKitModel.copyWith(prefix: prefix);
  }

  void setName(String name) {
    _postKitModel = _postKitModel.copyWith(name: name);
  }

  void setColor(String color) {
    _postKitModel = _postKitModel.copyWith(color: color);
  }

  void setBreed(String breed) {
    _postKitModel = _postKitModel.copyWith(breed: breed);
  }

  void setCage(String cage) {
    _postKitModel = _postKitModel.copyWith(cage: cage);
  }

  void setGender(GenderTypes? gender) {
    _postKitModel = _postKitModel.copyWith(gender: gender);
  }

  void setNote(String note) {
    _postKitModel = _postKitModel.copyWith(note: note);
  }

  Future<void> addKit(int litterId) async {
    emit(AddKitLoading());
    try {
      final kit = await _addKitRepo.addKit(litterId, _postKitModel);
      emit(AddKitSuccess(kit));
    } catch (e, s) {
      addError(e, s);
      emit(AddKitError(e.toString()));
    }
  }

  Future<void> updateKit({required int litterId, required int kitId}) async {
    emit(AddKitLoading());
    try {
      final kit = await _addKitRepo.updateKit(
        _postKitModel,
        kitId: kitId,
        litterId: litterId,
      );
      emit(UpdateKitSuccess(kit));
    } catch (e, s) {
      addError(e, s);
      emit(AddKitError(e.toString()));
    }
  }
}
