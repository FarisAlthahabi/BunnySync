import 'package:bunny_sync/features/app/view/bunny_sync_app.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/utils/run_app_with_reporting.dart';

void main() {
  runAppWithReporting(
    const BunnySyncApp(),
    preLaunch: configureDependencies,
  );
}