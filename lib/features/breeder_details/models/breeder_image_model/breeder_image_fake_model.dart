import 'package:bunny_sync/features/breeder_details/models/breeder_image_model/breeder_image_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';

final List<BreederImageModel> breederImagesFake = List.generate(
  5,
  (index) => BreederImageModel(
    breederId: 88,
    id: index + 1,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    path: 'd5Az6BDyQM-1716167170-rbPhO0dVqk.png',
    imageUrl: '${apiUrl}d5Az6BDyQM-1716167170-rbPhO0dVqk.png',
  ),
);
