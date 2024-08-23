import 'package:bunny_sync/features/profile/model/options_model/options_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';

abstract class BunnySyncJsonUtils {
  static bool isActiveFromJson(Map<String, dynamic> json) {
    return json['status'] == 'active';
  }

  static String setBreedersFileUrlFromJson(Map<String, dynamic> json) {
    String? path = json['path'] as String?;
    if (json['path'] != null) {
      path = json['path'] as String;
      return '${baseUrl}breeders/images/$path';
    } else if (json['breeder_images_path'] != null) {
      path = json['breeder_images_path'] as String;
      return '${baseUrl}breeders/images/$path';
    } else if (json['url'] != null) {
      path = json['url'] as String;
      return '$baseUrl${path.replaceFirst('/', '')}';
    } else {
      throw Exception('Path is not found');
    }
  }

  static List<String> featuresFromJson(Map<String, dynamic> json) {
    if (json['features'] is List<dynamic>) {
      return (json['features'] as List<dynamic>)
          .map((dynamic e) => e.toString())
          .toList();
    } else {
      return [];
    }
  }

  static OptionsModel optionsFromJson(Map<String, dynamic> json) {
    if (json['options'] is Map<String, dynamic>) {
      return OptionsModel.fromJson(json['options'] as Map<String, dynamic>);
    } else {
      return const OptionsModel.empty();
    }
  }
}
