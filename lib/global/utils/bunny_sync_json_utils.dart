import 'package:bunny_sync/global/dio/dio_client.dart';

abstract class BunnySyncJsonUtils {
  static bool isActiveFromJson(Map<String, dynamic> json) {
    return json['status'] == 'active';
  }

  static String setBreedersImageUrlFromJson(Map<String, dynamic> json) {
    String? path = json['path'] as String?;
    path ??= json['breeder_images_path'] as String;
    return '${baseUrl}breeders/images/$path';
  }
}
