import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/status/models/statusable_model.dart';
import 'package:bunny_sync/features/status/repo/status_repo.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/status_state.dart';

part 'states/general_status_state.dart';

@injectable
class StatusCubit extends Cubit<GeneralStatusState> {
  StatusCubit(this._statusRepo) : super(GeneralInitialStatusState());

  final StatusRepo _statusRepo;

  StatusTypes statusType = StatusTypes.archive;

  void setStatusType(StatusTypes? status) {
    if (status == null) {
      statusType = StatusTypes.archive;
    } else {
      statusType = status;
    }
  }

  Future<void> changeStatus(StatusableModel statusableModel) async {
    emit(ChangeStatusLoading());

    try {
      await _statusRepo.changeStatus(
        statusableModel,
        statusType,
      );
      final result = statusableModel.copyWithStatus(status: statusType);
      emit(ChangeStatusSuccess(result));
    } catch (e, s) {
      addError(e, s);
      emit(ChangeStatusFail(e.toString()));
    }
  }
}
