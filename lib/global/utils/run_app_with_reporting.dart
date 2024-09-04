import 'dart:async';

import 'package:bunny_sync/global/blocs/observer/bunny_sync_bloc_observer.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/repos/user_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> runAppWithReporting(
  Widget app, {
  required AsyncCallback preLaunch,
}) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await preLaunch();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      Bloc.observer = BunnySyncBlocObserver();
      runApp(app);

      final userRepo = get<UserRepo>();
      await userRepo.getKey(sendNotifications, defaultValue: true);
    },
    (error, stackTrace) {
      debugPrint('runAppWithReporting error: $error');
      debugPrint('runAppWithReporting stackTrace: $stackTrace');
    },
  );
}
