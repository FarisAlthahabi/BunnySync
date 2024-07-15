abstract class BunnySyncJsonUtils {
  static bool isActiveFromJson(Map<String, dynamic> json) {
    return json['status'] == 'active';
  }
}
