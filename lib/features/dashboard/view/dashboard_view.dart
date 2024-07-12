import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:bunny_sync/features/dashboard/view/widgets/add_new_type_widget.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/repos/repos.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DashboardViewCallback {
  void onBottomTab(
    int previousIndex,
    int currentIndex,
    TabsRouter tabsRouter,
  );

  void onAddTap();

  void onBreederTap();

  void onLittertap();
}

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => get<DashboardCubit>(),
        ),
      ],
      child: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    implements DashboardViewCallback {
  late final UserRepo userRepo = context.read();

  int currentIndex = 0;

  @override
  void onBottomTab(
    int previousIndex,
    int currentIndex,
    TabsRouter tabsRouter,
  ) {
    setState(() {
      this.currentIndex = currentIndex;
    });
    tabsRouter.setActiveIndex(currentIndex);
  }

  @override
  void onBreederTap() {
    Navigator.pop(context);
    context.router.push(
      AddBreederRoute(),
    );
  }

  @override
  void onLittertap() {
    Navigator.pop(context);
    context.router.push(
      AddBreederRoute(),
    );
  }

  @override
  void onAddTap() {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: "add_new_type".i18n,
        child: AddNewTypeWidget(
          onBreederTap: onBreederTap,
          onLitterTap: onLittertap,
        ),
      ),
    );
  }

  Widget getBottomBarIcon(String path, {required bool isSelected}) {
    return path.svg(
      color:
          isSelected ? context.cs.primary : context.cs.surfaceContainerHighest,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, GeneralDashboardState>(
      buildWhen: (prev, curr) => curr is ExtendBodyState,
      builder: (context, state) {
        return AutoTabsScaffold(
          routes: const [
            HomeRoute(),
            BreedersRoute(),
            LittersRoute(),
          ],
          extendBody: true,
          resizeToAvoidBottomInset: true,
          bottomNavigationBuilder: (context, tabsRouter) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppConstants.topCornersBorderRadius,
                boxShadow: kElevationToShadow[2],
              ),
              child: ClipRRect(
                borderRadius: AppConstants.topCornersBorderRadius,
                child: BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: (index) {
                    onBottomTab(currentIndex, index, tabsRouter);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: getBottomBarIcon(
                        Assets.icons.charts.path,
                        isSelected: currentIndex == 0,
                      ),
                      label: 'dashboard'.i18n,
                    ),
                    BottomNavigationBarItem(
                      icon: getBottomBarIcon(
                        Assets.icons.genders.path,
                        isSelected: currentIndex == 1,
                      ),
                      label: 'breeders'.i18n,
                    ),
                    BottomNavigationBarItem(
                      icon: getBottomBarIcon(
                        Assets.icons.squares.path,
                        isSelected: currentIndex == 2,
                      ),
                      label: 'litters'.i18n,
                    ),
                  ],
                ),
              ),
            );
          },
          floatingActionButton: FloatingActionButton(
            onPressed: onAddTap,
            shape: RoundedRectangleBorder(
              borderRadius: AppConstants.circularBorderRadius,
            ),
            backgroundColor: context.cs.secondaryContainer,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
