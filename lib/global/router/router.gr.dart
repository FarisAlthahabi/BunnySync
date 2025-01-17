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
    AddAilmentRoute.name: (routeData) {
      final args = routeData.argsAs<AddAilmentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddAilmentView(
          key: args.key,
          healthCubit: args.healthCubit,
          ailmentModel: args.ailmentModel,
        ),
      );
    },
    AddAttachmentRoute.name: (routeData) {
      final args = routeData.argsAs<AddAttachmentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddAttachmentView(
          key: args.key,
          breederId: args.breederId,
          breederDetailsCubit: args.breederDetailsCubit,
          attachmentModel: args.attachmentModel,
        ),
      );
    },
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
    AddCageRoute.name: (routeData) {
      final args = routeData.argsAs<AddCageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddCageView(
          key: args.key,
          cageCardsCubit: args.cageCardsCubit,
          cageModel: args.cageModel,
          isCopy: args.isCopy,
        ),
      );
    },
    AddCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<AddCategoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddCategoryView(
          key: args.key,
          categoriesCubit: args.categoriesCubit,
          categoryModel: args.categoryModel,
        ),
      );
    },
    AddCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<AddCustomerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddCustomerView(
          key: args.key,
          customersCubit: args.customersCubit,
          customerModel: args.customerModel,
        ),
      );
    },
    AddKitRoute.name: (routeData) {
      final args = routeData.argsAs<AddKitRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddKitView(
          key: args.key,
          litterId: args.litterId,
          kitModel: args.kitModel,
        ),
      );
    },
    AddLedgerRoute.name: (routeData) {
      final args = routeData.argsAs<AddLedgerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddLedgerView(
          key: args.key,
          ledgersCubit: args.ledgersCubit,
          ledger: args.ledger,
        ),
      );
    },
    AddLitterRoute.name: (routeData) {
      final args = routeData.argsAs<AddLitterRouteArgs>(
          orElse: () => const AddLitterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddLitterView(
          key: args.key,
          litterEntryModel: args.litterEntryModel,
        ),
      );
    },
    AddNoteRoute.name: (routeData) {
      final args = routeData.argsAs<AddNoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddNoteView(
          key: args.key,
          notesCubit: args.notesCubit,
          breederId: args.breederId,
          litterId: args.litterId,
        ),
      );
    },
    AddTaskRoute.name: (routeData) {
      final args = routeData.argsAs<AddTaskRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddTaskView(
          key: args.key,
          tasksCubit: args.tasksCubit,
          task: args.task,
        ),
      );
    },
    AddTreatmentRoute.name: (routeData) {
      final args = routeData.argsAs<AddTreatmentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddTreatmentView(
          key: args.key,
          healthCubit: args.healthCubit,
          treatmentModel: args.treatmentModel,
        ),
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
          initialIndex: args.initialIndex,
        ),
      );
    },
    BreedersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BreedersView(),
      );
    },
    CageCardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CageCardsView(),
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
    HealthRoute.name: (routeData) {
      final args = routeData.argsAs<HealthRouteArgs>(
          orElse: () => const HealthRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HealthView(
          key: args.key,
          addSuffixEmptySpace: args.addSuffixEmptySpace,
          breederId: args.breederId,
          ailmentsController: args.ailmentsController,
          treatmentsController: args.treatmentsController,
        ),
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
      final args = routeData.argsAs<LedgerRouteArgs>(
          orElse: () => const LedgerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LedgerView(
          key: args.key,
          addSuffixEmptySpace: args.addSuffixEmptySpace,
          breederId: args.breederId,
          litterId: args.litterId,
          controller: args.controller,
        ),
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
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    ReportsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportsView(),
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
          addSuffixEmptySpace: args.addSuffixEmptySpace,
          title: args.title,
          scrollController: args.scrollController,
          breederId: args.breederId,
          litterId: args.litterId,
        ),
      );
    },
  };
}

/// generated route for
/// [AddAilmentView]
class AddAilmentRoute extends PageRouteInfo<AddAilmentRouteArgs> {
  AddAilmentRoute({
    Key? key,
    required HealthCubit healthCubit,
    AilmentModel? ailmentModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddAilmentRoute.name,
          args: AddAilmentRouteArgs(
            key: key,
            healthCubit: healthCubit,
            ailmentModel: ailmentModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddAilmentRoute';

  static const PageInfo<AddAilmentRouteArgs> page =
      PageInfo<AddAilmentRouteArgs>(name);
}

class AddAilmentRouteArgs {
  const AddAilmentRouteArgs({
    this.key,
    required this.healthCubit,
    this.ailmentModel,
  });

  final Key? key;

  final HealthCubit healthCubit;

  final AilmentModel? ailmentModel;

  @override
  String toString() {
    return 'AddAilmentRouteArgs{key: $key, healthCubit: $healthCubit, ailmentModel: $ailmentModel}';
  }
}

/// generated route for
/// [AddAttachmentView]
class AddAttachmentRoute extends PageRouteInfo<AddAttachmentRouteArgs> {
  AddAttachmentRoute({
    Key? key,
    required int breederId,
    required BreederDetailsCubit breederDetailsCubit,
    AttachmentModel? attachmentModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddAttachmentRoute.name,
          args: AddAttachmentRouteArgs(
            key: key,
            breederId: breederId,
            breederDetailsCubit: breederDetailsCubit,
            attachmentModel: attachmentModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddAttachmentRoute';

  static const PageInfo<AddAttachmentRouteArgs> page =
      PageInfo<AddAttachmentRouteArgs>(name);
}

class AddAttachmentRouteArgs {
  const AddAttachmentRouteArgs({
    this.key,
    required this.breederId,
    required this.breederDetailsCubit,
    this.attachmentModel,
  });

  final Key? key;

  final int breederId;

  final BreederDetailsCubit breederDetailsCubit;

  final AttachmentModel? attachmentModel;

  @override
  String toString() {
    return 'AddAttachmentRouteArgs{key: $key, breederId: $breederId, breederDetailsCubit: $breederDetailsCubit, attachmentModel: $attachmentModel}';
  }
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
/// [AddCageView]
class AddCageRoute extends PageRouteInfo<AddCageRouteArgs> {
  AddCageRoute({
    Key? key,
    required CageCardsCubit cageCardsCubit,
    CageModel? cageModel,
    bool? isCopy,
    List<PageRouteInfo>? children,
  }) : super(
          AddCageRoute.name,
          args: AddCageRouteArgs(
            key: key,
            cageCardsCubit: cageCardsCubit,
            cageModel: cageModel,
            isCopy: isCopy,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCageRoute';

  static const PageInfo<AddCageRouteArgs> page =
      PageInfo<AddCageRouteArgs>(name);
}

class AddCageRouteArgs {
  const AddCageRouteArgs({
    this.key,
    required this.cageCardsCubit,
    this.cageModel,
    this.isCopy,
  });

  final Key? key;

  final CageCardsCubit cageCardsCubit;

  final CageModel? cageModel;

  final bool? isCopy;

  @override
  String toString() {
    return 'AddCageRouteArgs{key: $key, cageCardsCubit: $cageCardsCubit, cageModel: $cageModel, isCopy: $isCopy}';
  }
}

/// generated route for
/// [AddCategoryView]
class AddCategoryRoute extends PageRouteInfo<AddCategoryRouteArgs> {
  AddCategoryRoute({
    Key? key,
    required CategoriesCubit categoriesCubit,
    CategoryModel? categoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddCategoryRoute.name,
          args: AddCategoryRouteArgs(
            key: key,
            categoriesCubit: categoriesCubit,
            categoryModel: categoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static const PageInfo<AddCategoryRouteArgs> page =
      PageInfo<AddCategoryRouteArgs>(name);
}

class AddCategoryRouteArgs {
  const AddCategoryRouteArgs({
    this.key,
    required this.categoriesCubit,
    this.categoryModel,
  });

  final Key? key;

  final CategoriesCubit categoriesCubit;

  final CategoryModel? categoryModel;

  @override
  String toString() {
    return 'AddCategoryRouteArgs{key: $key, categoriesCubit: $categoriesCubit, categoryModel: $categoryModel}';
  }
}

/// generated route for
/// [AddCustomerView]
class AddCustomerRoute extends PageRouteInfo<AddCustomerRouteArgs> {
  AddCustomerRoute({
    Key? key,
    required CustomersCubit customersCubit,
    CustomerModel? customerModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddCustomerRoute.name,
          args: AddCustomerRouteArgs(
            key: key,
            customersCubit: customersCubit,
            customerModel: customerModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCustomerRoute';

  static const PageInfo<AddCustomerRouteArgs> page =
      PageInfo<AddCustomerRouteArgs>(name);
}

class AddCustomerRouteArgs {
  const AddCustomerRouteArgs({
    this.key,
    required this.customersCubit,
    this.customerModel,
  });

  final Key? key;

  final CustomersCubit customersCubit;

  final CustomerModel? customerModel;

  @override
  String toString() {
    return 'AddCustomerRouteArgs{key: $key, customersCubit: $customersCubit, customerModel: $customerModel}';
  }
}

/// generated route for
/// [AddKitView]
class AddKitRoute extends PageRouteInfo<AddKitRouteArgs> {
  AddKitRoute({
    Key? key,
    required int litterId,
    KitModel? kitModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddKitRoute.name,
          args: AddKitRouteArgs(
            key: key,
            litterId: litterId,
            kitModel: kitModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddKitRoute';

  static const PageInfo<AddKitRouteArgs> page = PageInfo<AddKitRouteArgs>(name);
}

class AddKitRouteArgs {
  const AddKitRouteArgs({
    this.key,
    required this.litterId,
    this.kitModel,
  });

  final Key? key;

  final int litterId;

  final KitModel? kitModel;

  @override
  String toString() {
    return 'AddKitRouteArgs{key: $key, litterId: $litterId, kitModel: $kitModel}';
  }
}

/// generated route for
/// [AddLedgerView]
class AddLedgerRoute extends PageRouteInfo<AddLedgerRouteArgs> {
  AddLedgerRoute({
    Key? key,
    required LedgersCubit ledgersCubit,
    LedgerModel? ledger,
    List<PageRouteInfo>? children,
  }) : super(
          AddLedgerRoute.name,
          args: AddLedgerRouteArgs(
            key: key,
            ledgersCubit: ledgersCubit,
            ledger: ledger,
          ),
          initialChildren: children,
        );

  static const String name = 'AddLedgerRoute';

  static const PageInfo<AddLedgerRouteArgs> page =
      PageInfo<AddLedgerRouteArgs>(name);
}

class AddLedgerRouteArgs {
  const AddLedgerRouteArgs({
    this.key,
    required this.ledgersCubit,
    this.ledger,
  });

  final Key? key;

  final LedgersCubit ledgersCubit;

  final LedgerModel? ledger;

  @override
  String toString() {
    return 'AddLedgerRouteArgs{key: $key, ledgersCubit: $ledgersCubit, ledger: $ledger}';
  }
}

/// generated route for
/// [AddLitterView]
class AddLitterRoute extends PageRouteInfo<AddLitterRouteArgs> {
  AddLitterRoute({
    Key? key,
    LitterEntryModel? litterEntryModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddLitterRoute.name,
          args: AddLitterRouteArgs(
            key: key,
            litterEntryModel: litterEntryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddLitterRoute';

  static const PageInfo<AddLitterRouteArgs> page =
      PageInfo<AddLitterRouteArgs>(name);
}

class AddLitterRouteArgs {
  const AddLitterRouteArgs({
    this.key,
    this.litterEntryModel,
  });

  final Key? key;

  final LitterEntryModel? litterEntryModel;

  @override
  String toString() {
    return 'AddLitterRouteArgs{key: $key, litterEntryModel: $litterEntryModel}';
  }
}

/// generated route for
/// [AddNoteView]
class AddNoteRoute extends PageRouteInfo<AddNoteRouteArgs> {
  AddNoteRoute({
    Key? key,
    required NotesCubit notesCubit,
    int? breederId,
    int? litterId,
    List<PageRouteInfo>? children,
  }) : super(
          AddNoteRoute.name,
          args: AddNoteRouteArgs(
            key: key,
            notesCubit: notesCubit,
            breederId: breederId,
            litterId: litterId,
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
    required this.notesCubit,
    this.breederId,
    this.litterId,
  });

  final Key? key;

  final NotesCubit notesCubit;

  final int? breederId;

  final int? litterId;

  @override
  String toString() {
    return 'AddNoteRouteArgs{key: $key, notesCubit: $notesCubit, breederId: $breederId, litterId: $litterId}';
  }
}

/// generated route for
/// [AddTaskView]
class AddTaskRoute extends PageRouteInfo<AddTaskRouteArgs> {
  AddTaskRoute({
    Key? key,
    required TasksCubit tasksCubit,
    TaskModel? task,
    List<PageRouteInfo>? children,
  }) : super(
          AddTaskRoute.name,
          args: AddTaskRouteArgs(
            key: key,
            tasksCubit: tasksCubit,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static const PageInfo<AddTaskRouteArgs> page =
      PageInfo<AddTaskRouteArgs>(name);
}

class AddTaskRouteArgs {
  const AddTaskRouteArgs({
    this.key,
    required this.tasksCubit,
    this.task,
  });

  final Key? key;

  final TasksCubit tasksCubit;

  final TaskModel? task;

  @override
  String toString() {
    return 'AddTaskRouteArgs{key: $key, tasksCubit: $tasksCubit, task: $task}';
  }
}

/// generated route for
/// [AddTreatmentView]
class AddTreatmentRoute extends PageRouteInfo<AddTreatmentRouteArgs> {
  AddTreatmentRoute({
    Key? key,
    required HealthCubit healthCubit,
    TreatmentModel? treatmentModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddTreatmentRoute.name,
          args: AddTreatmentRouteArgs(
            key: key,
            healthCubit: healthCubit,
            treatmentModel: treatmentModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTreatmentRoute';

  static const PageInfo<AddTreatmentRouteArgs> page =
      PageInfo<AddTreatmentRouteArgs>(name);
}

class AddTreatmentRouteArgs {
  const AddTreatmentRouteArgs({
    this.key,
    required this.healthCubit,
    this.treatmentModel,
  });

  final Key? key;

  final HealthCubit healthCubit;

  final TreatmentModel? treatmentModel;

  @override
  String toString() {
    return 'AddTreatmentRouteArgs{key: $key, healthCubit: $healthCubit, treatmentModel: $treatmentModel}';
  }
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
    int? initialIndex,
    List<PageRouteInfo>? children,
  }) : super(
          BreederDetailsRoute.name,
          args: BreederDetailsRouteArgs(
            key: key,
            breederEntryModel: breederEntryModel,
            initialIndex: initialIndex,
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
    this.initialIndex,
  });

  final Key? key;

  final BreederEntryModel breederEntryModel;

  final int? initialIndex;

  @override
  String toString() {
    return 'BreederDetailsRouteArgs{key: $key, breederEntryModel: $breederEntryModel, initialIndex: $initialIndex}';
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
/// [CageCardsView]
class CageCardsRoute extends PageRouteInfo<void> {
  const CageCardsRoute({List<PageRouteInfo>? children})
      : super(
          CageCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CageCardsRoute';

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
/// [HealthView]
class HealthRoute extends PageRouteInfo<HealthRouteArgs> {
  HealthRoute({
    Key? key,
    bool addSuffixEmptySpace = false,
    int? breederId,
    ScrollController? ailmentsController,
    ScrollController? treatmentsController,
    List<PageRouteInfo>? children,
  }) : super(
          HealthRoute.name,
          args: HealthRouteArgs(
            key: key,
            addSuffixEmptySpace: addSuffixEmptySpace,
            breederId: breederId,
            ailmentsController: ailmentsController,
            treatmentsController: treatmentsController,
          ),
          initialChildren: children,
        );

  static const String name = 'HealthRoute';

  static const PageInfo<HealthRouteArgs> page = PageInfo<HealthRouteArgs>(name);
}

class HealthRouteArgs {
  const HealthRouteArgs({
    this.key,
    this.addSuffixEmptySpace = false,
    this.breederId,
    this.ailmentsController,
    this.treatmentsController,
  });

  final Key? key;

  final bool addSuffixEmptySpace;

  final int? breederId;

  final ScrollController? ailmentsController;

  final ScrollController? treatmentsController;

  @override
  String toString() {
    return 'HealthRouteArgs{key: $key, addSuffixEmptySpace: $addSuffixEmptySpace, breederId: $breederId, ailmentsController: $ailmentsController, treatmentsController: $treatmentsController}';
  }
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
class LedgerRoute extends PageRouteInfo<LedgerRouteArgs> {
  LedgerRoute({
    Key? key,
    bool addSuffixEmptySpace = false,
    int? breederId,
    int? litterId,
    ScrollController? controller,
    List<PageRouteInfo>? children,
  }) : super(
          LedgerRoute.name,
          args: LedgerRouteArgs(
            key: key,
            addSuffixEmptySpace: addSuffixEmptySpace,
            breederId: breederId,
            litterId: litterId,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'LedgerRoute';

  static const PageInfo<LedgerRouteArgs> page = PageInfo<LedgerRouteArgs>(name);
}

class LedgerRouteArgs {
  const LedgerRouteArgs({
    this.key,
    this.addSuffixEmptySpace = false,
    this.breederId,
    this.litterId,
    this.controller,
  });

  final Key? key;

  final bool addSuffixEmptySpace;

  final int? breederId;

  final int? litterId;

  final ScrollController? controller;

  @override
  String toString() {
    return 'LedgerRouteArgs{key: $key, addSuffixEmptySpace: $addSuffixEmptySpace, breederId: $breederId, litterId: $litterId, controller: $controller}';
  }
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
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportsView]
class ReportsRoute extends PageRouteInfo<void> {
  const ReportsRoute({List<PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

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
    bool addSuffixEmptySpace = false,
    String? title,
    ScrollController? scrollController,
    int? breederId,
    int? litterId,
    List<PageRouteInfo>? children,
  }) : super(
          TasksRoute.name,
          args: TasksRouteArgs(
            key: key,
            addSuffixEmptySpace: addSuffixEmptySpace,
            title: title,
            scrollController: scrollController,
            breederId: breederId,
            litterId: litterId,
          ),
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static const PageInfo<TasksRouteArgs> page = PageInfo<TasksRouteArgs>(name);
}

class TasksRouteArgs {
  const TasksRouteArgs({
    this.key,
    this.addSuffixEmptySpace = false,
    this.title,
    this.scrollController,
    this.breederId,
    this.litterId,
  });

  final Key? key;

  final bool addSuffixEmptySpace;

  final String? title;

  final ScrollController? scrollController;

  final int? breederId;

  final int? litterId;

  @override
  String toString() {
    return 'TasksRouteArgs{key: $key, addSuffixEmptySpace: $addSuffixEmptySpace, title: $title, scrollController: $scrollController, breederId: $breederId, litterId: $litterId}';
  }
}
