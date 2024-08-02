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
    AddBreederRoute.name: (routeData) {
      final args = routeData.argsAs<AddBreederRouteArgs>(
          orElse: () => const AddBreederRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddBreederView(
          key: args.key,
          breederEntryModel: args.breederEntryModel,
        ),
      );
    },
    AddCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddCustomerView(),
      );
    },
    AddLitterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddLitterView(),
      );
    },
    AddNoteRoute.name: (routeData) {
      final args = routeData.argsAs<AddNoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddNoteView(
          key: args.key,
          breederId: args.breederId,
          breederDetailsCubit: args.breederDetailsCubit,
        ),
      );
    },
    AddTaskRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddTaskView(),
      );
    },
    AuthenticationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationView(),
      );
    },
    BarcodeScannerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BarcodeScannerView(),
      );
    },
    BreederDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BreederDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BreederDetailsView(
          key: args.key,
          breederEntryModel: args.breederEntryModel,
        ),
      );
    },
    BreedersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BreedersView(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoriesView(),
      );
    },
    CustomersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomersView(),
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
    LedgerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LedgerView(),
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
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
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
    TasksRoute.name: (routeData) {
      final args = routeData.argsAs<TasksRouteArgs>(
          orElse: () => const TasksRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TasksView(
          key: args.key,
          title: args.title,
          scrollController: args.scrollController,
        ),
      );
    },
  };
}

/// generated route for
/// [AddBreederView]
class AddBreederRoute extends PageRouteInfo<AddBreederRouteArgs> {
  AddBreederRoute({
    Key? key,
    BreederEntryModel? breederEntryModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddBreederRoute.name,
          args: AddBreederRouteArgs(
            key: key,
            breederEntryModel: breederEntryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddBreederRoute';

  static const PageInfo<AddBreederRouteArgs> page =
      PageInfo<AddBreederRouteArgs>(name);
}

class AddBreederRouteArgs {
  const AddBreederRouteArgs({
    this.key,
    this.breederEntryModel,
  });

  final Key? key;

  final BreederEntryModel? breederEntryModel;

  @override
  String toString() {
    return 'AddBreederRouteArgs{key: $key, breederEntryModel: $breederEntryModel}';
  }
}

/// generated route for
/// [AddCustomerView]
class AddCustomerRoute extends PageRouteInfo<void> {
  const AddCustomerRoute({List<PageRouteInfo>? children})
      : super(
          AddCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddLitterView]
class AddLitterRoute extends PageRouteInfo<void> {
  const AddLitterRoute({List<PageRouteInfo>? children})
      : super(
          AddLitterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddLitterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddNoteView]
class AddNoteRoute extends PageRouteInfo<AddNoteRouteArgs> {
  AddNoteRoute({
    Key? key,
    required int breederId,
    required BreederDetailsCubit breederDetailsCubit,
    List<PageRouteInfo>? children,
  }) : super(
          AddNoteRoute.name,
          args: AddNoteRouteArgs(
            key: key,
            breederId: breederId,
            breederDetailsCubit: breederDetailsCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const PageInfo<AddNoteRouteArgs> page =
      PageInfo<AddNoteRouteArgs>(name);
}

class AddNoteRouteArgs {
  const AddNoteRouteArgs({
    this.key,
    required this.breederId,
    required this.breederDetailsCubit,
  });

  final Key? key;

  final int breederId;

  final BreederDetailsCubit breederDetailsCubit;

  @override
  String toString() {
    return 'AddNoteRouteArgs{key: $key, breederId: $breederId, breederDetailsCubit: $breederDetailsCubit}';
  }
}

/// generated route for
/// [AddTaskView]
class AddTaskRoute extends PageRouteInfo<void> {
  const AddTaskRoute({List<PageRouteInfo>? children})
      : super(
          AddTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [BarcodeScannerView]
class BarcodeScannerRoute extends PageRouteInfo<void> {
  const BarcodeScannerRoute({List<PageRouteInfo>? children})
      : super(
          BarcodeScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'BarcodeScannerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BreederDetailsView]
class BreederDetailsRoute extends PageRouteInfo<BreederDetailsRouteArgs> {
  BreederDetailsRoute({
    Key? key,
    required BreederEntryModel breederEntryModel,
    List<PageRouteInfo>? children,
  }) : super(
          BreederDetailsRoute.name,
          args: BreederDetailsRouteArgs(
            key: key,
            breederEntryModel: breederEntryModel,
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
    required this.breederEntryModel,
  });

  final Key? key;

  final BreederEntryModel breederEntryModel;

  @override
  String toString() {
    return 'BreederDetailsRouteArgs{key: $key, breederEntryModel: $breederEntryModel}';
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
/// [CategoriesView]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomersView]
class CustomersRoute extends PageRouteInfo<void> {
  const CustomersRoute({List<PageRouteInfo>? children})
      : super(
          CustomersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomersRoute';

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
/// [LedgerView]
class LedgerRoute extends PageRouteInfo<void> {
  const LedgerRoute({List<PageRouteInfo>? children})
      : super(
          LedgerRoute.name,
          initialChildren: children,
        );

  static const String name = 'LedgerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LitterDetailsView]
class LitterDetailsRoute extends PageRouteInfo<LitterDetailsRouteArgs> {
  LitterDetailsRoute({
    Key? key,
    required LitterEntryModel litter,
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

  final LitterEntryModel litter;

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
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

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

/// generated route for
/// [TasksView]
class TasksRoute extends PageRouteInfo<TasksRouteArgs> {
  TasksRoute({
    Key? key,
    String? title,
    ScrollController? scrollController,
    List<PageRouteInfo>? children,
  }) : super(
          TasksRoute.name,
          args: TasksRouteArgs(
            key: key,
            title: title,
            scrollController: scrollController,
          ),
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static const PageInfo<TasksRouteArgs> page = PageInfo<TasksRouteArgs>(name);
}

class TasksRouteArgs {
  const TasksRouteArgs({
    this.key,
    this.title,
    this.scrollController,
  });

  final Key? key;

  final String? title;

  final ScrollController? scrollController;

  @override
  String toString() {
    return 'TasksRouteArgs{key: $key, title: $title, scrollController: $scrollController}';
  }
}
