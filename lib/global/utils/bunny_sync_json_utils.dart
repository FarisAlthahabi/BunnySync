import 'package:bunny_sync/features/profile/model/options_model/options_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';

abstract class BunnySyncJsonUtils {
  static bool isActiveFromJson(Map<String, dynamic> json) {
    return json['status'] == 'active';
  }

  static String setFileUrlFromJson(Map<String, dynamic> json) {
    final path = json['path'] as String?;
    if (path != null) {
      return '$baseUrl$path';
    } else {
      return '';
    }
  }

  static String setBreedersImageUrlFromJson(Map<String, dynamic> json) {
    final path = json['path'] as String?;
    final breedersImagesPath = json['breeder_images_path'] as String?;

    if (path != null) {
      return '${baseUrl}breeders/images/$path';
    } else if (breedersImagesPath != null) {
      return '${baseUrl}breeders/images/$breedersImagesPath';
    } else {
      return '';
    }
  }

  static String setBreedersPedigreeUrlFromJson(Map<String, dynamic> json) {
    final url = json['url'] as String?;
    if (url != null) {
      return '$baseUrl${url.replaceFirst('/', '')}';
    } else {
      return '';
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
