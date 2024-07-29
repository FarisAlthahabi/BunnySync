import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_breeder/view/add_breeder_view.dart';
import 'package:bunny_sync/features/add_litter/view/add_litter_view.dart';
import 'package:bunny_sync/features/add_note/view/add_note_view.dart';
import 'package:bunny_sync/features/add_task/view/add_task_view.dart';
import 'package:bunny_sync/features/authentication/view/authentication_view.dart';
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/view/breeder_details_view.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/breeders/view/breeders_view.dart';
import 'package:bunny_sync/features/breeders/view/widgets/scanner_view/scanner_view.dart';
import 'package:bunny_sync/features/dashboard/view/dashboard_view.dart';
import 'package:bunny_sync/features/home/view/home_view.dart';
import 'package:bunny_sync/features/intro/view/intro_router.dart';
import 'package:bunny_sync/features/intro/view/intro_view.dart';
import 'package:bunny_sync/features/litter_details/view/litter_details_view.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/litters/view/litters_view.dart';
import 'package:bunny_sync/features/main_navigation/view/main_navigation_view.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/select_subscription_plan_view.dart';
import 'package:bunny_sync/features/settings/view/settings_view.dart';
import 'package:bunny_sync/features/sign_in/view/sign_in_view.dart';
import 'package:bunny_sync/features/splash/view/splash_view.dart';
import 'package:bunny_sync/features/tasks/view/tasks_view.dart';
import 'package:flutter/material.dart';

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
            AutoRoute(
              page: IntroRouter.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: IntroRoute.page,
                ),
                AutoRoute(
                  page: SelectSubscriptionPlanRoute.page,
                ),
              ],
            ),
            AdaptiveRoute(
              page: MainNavigationRoute.page,
              children: [
                AutoRoute(
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
                     AutoRoute(
                      page: SettingsRoute.page,
                    ),
                  ],
                ),
                AutoRoute(
                  page: BreederDetailsRoute.page,
                ),
                AutoRoute(
                  page: LitterDetailsRoute.page,
                ),
                AutoRoute(
                  page: AddBreederRoute.page,
                ),
                AutoRoute(
                  page: AddLitterRoute.page,
                ),
                AutoRoute(
                  page: AddNoteRoute.page,
                ),
                AutoRoute(
                  page: BarcodeScannerRoute.page,
                ),
                AutoRoute(
                  page: TasksRoute.page,
                ),
                AutoRoute(
                  page: AddTaskRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}
