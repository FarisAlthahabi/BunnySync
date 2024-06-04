import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/repos/repos.dart';
import 'package:bunny_sync/global/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DashboardViewCallback {
  void onBottomTab(
    int previousIndex,
    int currentIndex,
    TabsRouter tabsRouter,
  );
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
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, GeneralDashboardState>(
      buildWhen: (prev, curr) => curr is ExtendBodyState,
      builder: (context, state) {
        return AutoTabsScaffold(
          routes: const [

          ],
          extendBody: true,
          resizeToAvoidBottomInset: true,
          bottomNavigationBuilder: (context, tabsRouter) {
            return Container(
              height: kBottomNavigationBarHeight,
              decoration: const BoxDecoration(
                borderRadius: AppConstants.topCornersBorderRadius,
              ),
              child: ClipRRect(
                borderRadius: AppConstants.topCornersBorderRadius,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  selectedItemColor: Colors.white,
                  onTap: (index) {
                    onBottomTab(currentIndex, index, tabsRouter);
                  },
                  selectedLabelStyle: const TextStyle(color: Colors.white),
                  unselectedItemColor: Colors.white,
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  items: const [],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
