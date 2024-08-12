import 'package:bunny_sync/features/profile/model/options_model/options_model.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_fake_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';

abstract class BunnySyncJsonUtils {
  static bool isActiveFromJson(Map<String, dynamic> json) {
    return json['status'] == 'active';
  }

  static String setBreedersImageUrlFromJson(Map<String, dynamic> json) {
    String? path = json['path'] as String?;
    path ??= json['breeder_images_path'] as String? ?? '';
    return '${baseUrl}breeders/images/$path';
  }

  static List<String> featuresFromJson(Map<String, dynamic> json) {
    if (json['features'] is String) {
      return [];
    } else {
      return json['features'] as List<String>;
    }
  }

  static OptionsModel optionsFromJson(Map<String, dynamic> json) {
    if (json['options'] is String) {
      return fakeOptions;
    } else {
      return json['options'] as OptionsModel;
    }
  }
}
