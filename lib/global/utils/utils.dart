import 'package:bunny_sync/global/localization/localization.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Utils {
  static void setStatusBarColor(
    Color statusBarColor, {
    Brightness? brightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: brightness,
      ),
    );
  }

  static Set<T> intersection<T>(List<List<T>> lists) {
    return lists.fold<Set<T>>(
      lists.first.toSet(),
      (a, b) => a.intersection(b.toSet()),
    );
  }

  static Future<void> openUrl(String url, {VoidCallback? onError}) async {
    final urlVar = url;
    try {
      if (urlVar.isEmpty) {
        return;
      }
      await launchUrl(
        Uri.parse(urlVar),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      onError?.call();
    }
  }

  static void showComingSoonToast() {
    Fluttertoast.showToast(
      msg: 'coming_soon'.i18n,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
