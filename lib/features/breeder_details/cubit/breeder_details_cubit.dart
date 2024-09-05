import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeder_details/models/attachment_model/attachment_model.dart';
import 'package:bunny_sync/features/breeder_details/models/attachment_model/breeder_attachments_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_image_model/breeder_image_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_image_model/breeder_image_model.dart';
import 'package:bunny_sync/features/breeder_details/models/pedigree_model/pedigree_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/pedigree_url_model/pedigree_url_model.dart';
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/note_model/note_model.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeder_attachments_state/breeder_attachments_state.dart';

part 'states/breeder_attachments_state/delete_breeder_attachment_state.dart';

part 'states/breeder_details_state.dart';

part 'states/breeder_images_state/breeder_images_actions_state.dart';

part 'states/breeder_images_state/breeder_images_state.dart';

part 'states/breeder_pedigree_state.dart';

part 'states/breeder_profile_state.dart';

part 'states/general_breeder_details_state.dart';

@injectable
class BreederDetailsCubit extends Cubit<GeneralBreederDetailsState> {
  BreederDetailsCubit(
    this._breederDetailsRepo,
    @factoryParam this.breeder,
  ) : super(BreederDetailsInitial());

  final BreederDetailsRepo _breederDetailsRepo;

  List<NoteModel> notes = [];

  BreederEntryModel breeder;

  List<BreederImageModel> breederImages = [];

  List<AttachmentModel> attachments = [];

  Future<void> getBreederDetails() async {
    emit(BreederDetailsSuccess(breeder));
  }

  Future<void> getBreederProfile() async {
    emit(BreederProfileLoading(breederDetailsResponseFakeModel));

    try {
      final response = await _breederDetailsRepo.getBreederDetails(breeder.id);
      emit(BreederProfileSuccess(response.data));
    } catch (e, s) {
      addError(e, s);
      emit(BreederProfileFail(e.toString()));
    }
  }

  Future<void> getBreederPedigree(int breederId) async {
    emit(BreederPedigreeLoading(pedigreeUrlFakeModel));

    try {
      final response = await _breederDetailsRepo.getBreederPedigree(breederId);
      emit(BreederPedigreeSuccess(response.data));
    } catch (e, s) {
      addError(e, s);
      emit(BreederPedigreeFail(e.toString()));
    }
  }

  void emitPedigreeLoading() {
    emit(BreederPedigreeLoading(pedigreeUrlFakeModel));
  }

  void emitPedigreeWebViewSuccess() {
    emit(BreederPedigreeWebViewSuccess());
  }

  Future<void> getBreederImages(int breederId) async {
    emit(BreederImagesLoading(breederImagesFake));
    try {
      final response = await _breederDetailsRepo.getBreederImages(breederId);
      if (response.isEmpty) {
        emit(BreederImagesEmpty('images_empty'.i18n));
      } else {
        breederImages = response;
        emit(BreederImagesSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(BreederImagesFail(e.toString()));
    }
  }

  Future<void> addBreederImage(int breederId, XFile image) async {
    emit(BreederImageAddLoading());
    try {
      final response =
          await _breederDetailsRepo.addBreederImage(breederId, image);
      breederImages.add(response);
      emit(BreederImageAddSuccess());

      if (breederImages.isEmpty) {
        emit(BreederImagesEmpty('images_empty'.i18n));
      } else {
        emit(BreederImagesSuccess(breederImages));
      }
    } catch (e, s) {
      addError(e, s);
      emit(BreederImageAddFail(e.toString()));
    }
  }

  Future<void> deleteBreederImage(int breederId, int imageId) async {
    emit(BreederImageAddLoading());
    try {
      await _breederDetailsRepo.deleteBreederImage(breederId, imageId);
      breederImages.removeWhere(
        (element) => element.id == imageId,
      );
      emit(BreederImageDeleteSuccess());

      if (breederImages.isEmpty) {
        emit(BreederImagesEmpty('images_empty'.i18n));
      } else {
        emit(BreederImagesSuccess(breederImages));
      }
    } catch (e, s) {
      addError(e, s);
      emit(BreederImageDeleteFail(e.toString()));
    }
  }

  void updateBreeder(BreederEntryModel breeder) {
    this.breeder = breeder;
    emit(BreederDetailsSuccess(breeder));
  }

  Future<void> getAttachments(int breederId) async {
    emit(BreederAttachmentsLoading(breederAttachmentsFake));
    try {
      final response = await _breederDetailsRepo.getAttachments(breederId);
      if (response.isEmpty) {
        emit(BreederAttachmentsEmpty('attachments_empty'.i18n));
      } else {
        attachments = response;
        emit(BreederAttachmentsSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(BreederAttachmentsFail(e.toString()));
    }
  }

  void addAttachment(AttachmentModel attachment) {
    attachments.add(attachment);
    emit(BreederAttachmentsSuccess(attachments));
  }

  void updateAttachment(AttachmentModel attachment) {
    attachments = attachments.map((e) {
      if (e.id == attachment.id) {
        return attachment;
      }
      return e;
    }).toList();
    emit(BreederAttachmentsSuccess(attachments));
  }

  Future<void> deleteAttachment(int attachmentId) async {
    emit(DeleteBreederAttachmentLoading());

    try {
      await _breederDetailsRepo.deleteAttachment(attachmentId);
      attachments.removeWhere(
        (element) => element.id == attachmentId,
      );

      emit(DeleteBreederAttachmentSuccess());

      if (attachments.isEmpty) {
        emit(BreederAttachmentsEmpty('attachments_empty'.i18n));
      } else {
        emit(BreederAttachmentsSuccess(attachments));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteBreederAttachmentFail(e.toString()));
    }
  }
}
