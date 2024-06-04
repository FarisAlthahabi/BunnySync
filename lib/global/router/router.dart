import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/authentication/view/authentication_view.dart';
import 'package:bunny_sync/features/dashboard/view/dashboard_view.dart';
import 'package:bunny_sync/features/main_navigation/view/main_navigation_view.dart';
import 'package:bunny_sync/features/sign_in/view/sign_in_view.dart';
import 'package:bunny_sync/features/splash/view/splash_view.dart';
import 'package:flutter/foundation.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Tab|Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
          page: SplashRoute.page,
        ),
        AdaptiveRoute(
          page: AuthenticationRoute.page,
          children: [
            AdaptiveRoute(
              page: SignInRoute.page,
            ),
            AdaptiveRoute(
              page: MainNavigationRoute.page,
              children: [
                AdaptiveRoute(
                  initial: true,
                  page: DashboardRoute.page,
                  children: const [],
                ),
              ],
            ),
          ],
        ),
      ];
}
