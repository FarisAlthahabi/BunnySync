import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/tabs/couse_death_tab.dart';
import 'package:bunny_sync/features/reports/view/tabs/doe_cost_tab.dart';
import 'package:bunny_sync/features/reports/view/tabs/kit_weight_tab.dart';
import 'package:bunny_sync/features/reports/view/tabs/litter_size_tab.dart';
import 'package:bunny_sync/features/reports/view/tabs/live_and_dead_tab.dart';
import 'package:bunny_sync/features/reports/view/tabs/survival_rate_tab.dart';
import 'package:bunny_sync/features/reports/view/widgets/report_stats_widget.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class ReportsViewCallBacks {
  void onTryAgainTap();
}

@RoutePage()
class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<ReportsCubit>(),
      child: const ReportsPage(),
    );
  }
}

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage>
    with SingleTickerProviderStateMixin
    implements ReportsViewCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  List<TabModel> get tabs => [
        TabModel(title: 'gestation_days'.i18n),
        TabModel(title: 'doe_missed'.i18n),
        TabModel(title: 'buck_missed'.i18n),
        TabModel(title: 'litter_size'.i18n),
        TabModel(title: 'doe_cost'.i18n),
        TabModel(title: 'survival_rate'.i18n),
        TabModel(title: 'live_&_dead_kits'.i18n),
        TabModel(title: 'kit_weight'.i18n),
        TabModel(title: 'growth_rate'.i18n),
        TabModel(title: 'couse_of_death'.i18n),
        TabModel(title: 'breeder_mortality'.i18n),
        TabModel(title: 'kits_mortality'.i18n),
        TabModel(title: 'inactive_breeders'.i18n),
      ];

  final pages = [
    const Center(
      child: SfCartesianChart(),
    ),
    const Center(
      child: SfCartesianChart(),
    ),
    const Center(
      child: SfCartesianChart(),
    ),
    const KeepAliveWidget(
      child: LitterSizeTab(),
    ),
    const KeepAliveWidget(
      child: DoeCostTab(),
    ),
    const KeepAliveWidget(
      child: SurvivalRateTab(),
    ),
    const KeepAliveWidget(
      child: LiveAndDeadTab(),
    ),
    const KeepAliveWidget(
      child: KitWeightTab(),
    ),
    const ColoredBox(
      color: Colors.blue,
      child: Text('hello'),
    ),
    const KeepAliveWidget(
      child: CouseDeathTab(),
    ),
    const ColoredBox(
      color: Colors.blue,
      child: Text('hello'),
    ),
    const ColoredBox(
      color: Colors.blue,
      child: Text('hello'),
    ),
    const ColoredBox(
      color: Colors.blue,
      child: Text('hello'),
    ),
  ];

  late final TabController tabController =
      TabController(length: tabs.length, vsync: this);
  late final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    reportsCubit.getReportStats();
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        pageController.jumpToPage(tabController.index);
      }
    });
    pageController.addListener(() {
      if (pageController.page!.round() != tabController.index) {
        tabController.animateTo(pageController.page!.round());
      }
    });
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getReportStats();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppConstants.padding16,
            child: Column(
              children: [
                BlocBuilder<ReportsCubit, GeneralReportsState>(
                  buildWhen: (previous, current) => current is ReportStatsState,
                  builder: (context, state) {
                    if (state is ReportStatsFetch) {
                      return Skeletonizer(
                        enabled: state is ReportStatsLoading,
                        child: ReportStatsWidget(
                          reportStats: state.reportStats,
                        ),
                      );
                    } else if (state is ReportStatsFail) {
                      return MainErrorWidget(
                        error: state.message,
                        onTap: onTryAgainTap,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DetailsTabBar(
                  tabs: tabs,
                  tabController: tabController,
                ),
                ExpandablePageView.builder(
                  controller: pageController,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
