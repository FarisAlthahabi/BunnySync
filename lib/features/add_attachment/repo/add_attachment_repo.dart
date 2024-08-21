import 'package:bunny_sync/features/add_attachment/model/attachment_post_model/attachment_post_model.dart';
import 'package:bunny_sync/features/breeder_details/models/attachment_model/attachment_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'http_add_attachment_repo.dart';

abstract class AddAttachmentRepo {
  Future<AttachmentModel> addAttachment(
    AttachmentPostModel attachmentPostModel,
    int breederId,
  );

  Future<AttachmentModel> updateAttachment(
    AttachmentPostModel attachmentPostModel,
    int attachmentId,
  );
}
