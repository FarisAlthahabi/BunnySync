import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/authentication/view/authentication_view.dart';
import 'package:bunny_sync/features/breeders/view/breeders_view.dart';
import 'package:bunny_sync/features/dashboard/view/dashboard_view.dart';
import 'package:bunny_sync/features/home/view/home_view.dart';
import 'package:bunny_sync/features/intro/view/intro_view.dart';
import 'package:bunny_sync/features/litters/view/litters_view.dart';
import 'package:bunny_sync/features/main_navigation/view/main_navigation_view.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/select_subscription_plan_view.dart';
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
                //TODO: Grouping intro and select plan into onboarding parent route
                AutoRoute(
                  page: IntroRoute.page,
                ),
                AutoRoute(
                  page: SelectSubscriptionPlanRoute.page,
                ),
                AutoRoute(
                  page: SignInRoute.page,
                ),
                AdaptiveRoute(
                  initial: true,
                  page: DashboardRoute.page,
                  children: [
                    AutoRoute(
                      initial: true,
                      page: HomeRoute.page,
                    ),
                    AutoRoute(
                      page: BreedersRoute.page,
                    ),
                    AutoRoute(
                      page: LittersRoute.page,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ];
}
