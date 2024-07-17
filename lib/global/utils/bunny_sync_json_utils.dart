
abstract class BunnySyncJsonUtils {
  static bool isActiveFromJson(Map<String, dynamic> json) {
    return json['status'] == 'active';
  }

  static String setImageUrlFromJson(Map<String, dynamic> json) {
    final String path = json['path'] as String;
    return 'http://bunnysync.bunnyhorde.com/api/$path';
  }
}
