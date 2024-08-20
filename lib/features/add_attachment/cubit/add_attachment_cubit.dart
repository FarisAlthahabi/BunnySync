import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_attachment/model/attachment_post_model/attachment_post_model.dart';
import 'package:bunny_sync/features/add_attachment/repo/add_attachment_repo.dart';
import 'package:bunny_sync/features/breeder_details/models/attachment_model/attachment_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_attachment_state.dart';

part 'states/general_add_attachment_state.dart';

@injectable
class AddAttachmentCubit extends Cubit<GeneralAddAttachmentState> {
  AddAttachmentCubit(this._addAttachmentRepo) : super(AddAttachmentInitial());

  final AddAttachmentRepo _addAttachmentRepo;

  AttachmentPostModel _attachmentPostModel = const AttachmentPostModel();

  void setTitle(String title) {
    _attachmentPostModel = _attachmentPostModel.copyWith(
      title: () => title,
    );
  }

  void setFile(String file) {
    _attachmentPostModel = _attachmentPostModel.copyWith(
      file: () => file,
    );
  }

  Future<void> addAttachment(int breederId) async {
    emit(AddAttachmentLoading());

    try {
      final attachment = await _addAttachmentRepo.addAttachment(
        _attachmentPostModel,
        breederId,
      );
      emit(AddAttachmentSuccess(attachment));
    } catch (e, s) {
      addError(e, s);
      emit(AddAttachmentFail(e.toString()));
    }
  }

  Future<void> updateAttachment(int attachmentId) async {
    emit(AddAttachmentLoading());

    try {
      final attachment = await _addAttachmentRepo.updateAttachment(
        _attachmentPostModel,
        attachmentId,
      );
      emit(UpdateAttachmentSuccess(attachment));
    } catch (e, s) {
      addError(e, s);
      emit(AddAttachmentFail(e.toString()));
    }
  }
}
