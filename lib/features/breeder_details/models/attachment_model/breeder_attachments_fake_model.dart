import 'package:bunny_sync/features/breeder_details/models/attachment_model/attachment_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';

final breederAttachmentsFake = List.generate(
  6,
  (index) => AttachmentModel(
    id: index,
    breederId: 88,
    title: 'title',
    path: 'd5Az6BDyQM-1716167170-rbPhO0dVqk.png',
    imageUrl: '${baseUrl}d5Az6BDyQM-1716167170-rbPhO0dVqk.png',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);
