part of 'add_attachment_repo.dart';

@Injectable(as: AddAttachmentRepo)
class HttpAddAttachmentRepo implements AddAttachmentRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<AttachmentModel> addAttachment(
    AttachmentPostModel attachmentPostModel,
    int breederId,
  ) async {
    try {
      final response = await _dioClient.post(
        '/breeders/attachment/$breederId/store',
        data: attachmentPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;
      return AttachmentModel.fromJson(body['file'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<AttachmentModel> updateAttachment(
    AttachmentPostModel attachmentPostModel,
    int attachmentId,
  ) async {
    try {
      final response = await _dioClient.put(
        '/breeders/attachment/$attachmentId/update',
        data: attachmentPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;
       return AttachmentModel.fromJson(body['file'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
