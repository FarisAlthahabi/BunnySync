// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationView(),
      );
    },
    BreederDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BreederDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BreederDetailsView(
          key: args.key,
          breeder: args.breeder,
        ),
      );
    },
    BreedersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BreedersView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    IntroRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntroRoutePage(),
      );
    },
    IntroRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntroView(),
      );
    },
    LitterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<LitterDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LitterDetailsView(
          key: args.key,
          litter: args.litter,
        ),
      );
    },
    LittersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LittersView(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainNavigationView(),
      );
    },
    SelectSubscriptionPlanRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectSubscriptionPlanView(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInView(
          key: args.key,
          onSignedIn: args.onSignedIn,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [AuthenticationView]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BreederDetailsView]
class BreederDetailsRoute extends PageRouteInfo<BreederDetailsRouteArgs> {
  BreederDetailsRoute({
    Key? key,
    required BreederModel breeder,
    List<PageRouteInfo>? children,
  }) : super(
          BreederDetailsRoute.name,
          args: BreederDetailsRouteArgs(
            key: key,
            breeder: breeder,
          ),
          initialChildren: children,
        );

  static const String name = 'BreederDetailsRoute';

  static const PageInfo<BreederDetailsRouteArgs> page =
      PageInfo<BreederDetailsRouteArgs>(name);
}

class BreederDetailsRouteArgs {
  const BreederDetailsRouteArgs({
    this.key,
    required this.breeder,
  });

  final Key? key;

  final BreederModel breeder;

  @override
  String toString() {
    return 'BreederDetailsRouteArgs{key: $key, breeder: $breeder}';
  }
}

/// generated route for
/// [BreedersView]
class BreedersRoute extends PageRouteInfo<void> {
  const BreedersRoute({List<PageRouteInfo>? children})
      : super(
          BreedersRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreedersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroRoutePage]
class IntroRouter extends PageRouteInfo<void> {
  const IntroRouter({List<PageRouteInfo>? children})
      : super(
          IntroRouter.name,
          initialChildren: children,
        );

  static const String name = 'IntroRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroView]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute({List<PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LitterDetailsView]
class LitterDetailsRoute extends PageRouteInfo<LitterDetailsRouteArgs> {
  LitterDetailsRoute({
    Key? key,
    required LitterModel litter,
    List<PageRouteInfo>? children,
  }) : super(
          LitterDetailsRoute.name,
          args: LitterDetailsRouteArgs(
            key: key,
            litter: litter,
          ),
          initialChildren: children,
        );

  static const String name = 'LitterDetailsRoute';

  static const PageInfo<LitterDetailsRouteArgs> page =
      PageInfo<LitterDetailsRouteArgs>(name);
}

class LitterDetailsRouteArgs {
  const LitterDetailsRouteArgs({
    this.key,
    required this.litter,
  });

  final Key? key;

  final LitterModel litter;

  @override
  String toString() {
    return 'LitterDetailsRouteArgs{key: $key, litter: $litter}';
  }
}

/// generated route for
/// [LittersView]
class LittersRoute extends PageRouteInfo<void> {
  const LittersRoute({List<PageRouteInfo>? children})
      : super(
          LittersRoute.name,
          initialChildren: children,
        );

  static const String name = 'LittersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationView]
class MainNavigationRoute extends PageRouteInfo<void> {
  const MainNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MainNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectSubscriptionPlanView]
class SelectSubscriptionPlanRoute extends PageRouteInfo<void> {
  const SelectSubscriptionPlanRoute({List<PageRouteInfo>? children})
      : super(
          SelectSubscriptionPlanRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectSubscriptionPlanRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInView]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    void Function()? onSignedIn,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(
            key: key,
            onSignedIn: onSignedIn,
          ),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<SignInRouteArgs> page = PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({
    this.key,
    this.onSignedIn,
  });

  final Key? key;

  final void Function()? onSignedIn;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onSignedIn: $onSignedIn}';
  }
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
