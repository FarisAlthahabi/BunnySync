import 'package:bunny_sync/features/breeder_details/models/attachment_model/attachment_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_image_model/breeder_image_model.dart';
import 'package:bunny_sync/features/breeder_details/models/pedigree_url_model/pedigree_url_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/response_model/response_model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'http_breeder_details_repo.dart';

abstract class BreederDetailsRepo {
  Future<ResponseModel<BreederDetailsResponseModel>> getBreederDetails(int id);

  Future<ResponseModel<PedigreeUrlModel>> getBreederPedigree(int id);

  // Future<List<NoteModel>> getBreederNotes({
  //   int? breederId,
  //   int? litterId,
  // });

  Future<List<BreederImageModel>> getBreederImages(int id);

  // Future<void> deleteNote({
  //   int? breederId,
  //   int? litterId,
  // });

  Future<BreederImageModel> addBreederImage(int id, XFile image);

  Future<void> deleteBreederImage(int breederId, int imageId);

  Future<List<AttachmentModel>> getAttachments(int breederId);

  Future<void> deleteAttachment(int attachmentId);
}
