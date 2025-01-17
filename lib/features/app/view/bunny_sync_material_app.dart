import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BunnySyncMaterialApp extends StatefulWidget {
  const BunnySyncMaterialApp({super.key});

  @override
  State<BunnySyncMaterialApp> createState() => _BunnySyncMaterialAppState();
}

class _BunnySyncMaterialAppState extends State<BunnySyncMaterialApp> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return SkeletonizerConfig(
          data: const SkeletonizerConfigData(),
          child: GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidgetBuilder: (_) {
              return Center(
                child: LoadingIndicator(
                  color: context.cs.primary,
                ),
              );
            },
            child: MaterialApp.router(
              title: 'app_name'.i18n,
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              routerDelegate: appRouter.delegate(
                navigatorObservers: () => [
                  HeroController(),
                ],
              ),
              routeInformationParser: appRouter.defaultRouteParser(),
            ),
          ),
        );
      },
    );
  }
}
