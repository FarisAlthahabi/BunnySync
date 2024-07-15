import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/delete_breeder_state.dart';

part 'states/general_delete_breeder_state.dart';

@injectable
class DeleteBreederCubit extends Cubit<GeneralDeleteBreederState> {
  DeleteBreederCubit(
    this._deleteBreederRepo,
  ) : super(GeneralDeleteBreederInitial());

  final DeleteBreederRepo _deleteBreederRepo;

  Future<void> deleteBreeder(BreederEntryModel breederEntryModel) async {
    emit(DeleteBreederLoading());
    try {
      await _deleteBreederRepo.deleteBreeder(breederEntryModel.id);
      emit(DeleteBreederSuccess(breeder: breederEntryModel));
    } catch (e, s) {
      addError(e, s);
      emit(DeleteBreederFail(e.toString()));
    }
  }
}
