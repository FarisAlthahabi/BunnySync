import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/view/widgets/tab_header.dart';
import 'package:bunny_sync/features/health/view/tabs/ailments_tab.dart';
import 'package:bunny_sync/features/health/view/tabs/treatment_tab.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HealthView extends StatelessWidget {
  const HealthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthPage();
  }
}

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    final tabs = <TabModel>[
      TabModel(
        title: 'ailments'.i18n,
      ),
      TabModel(
        title: 'treatments'.i18n,
      ),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MainAppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('health'.i18n,style: context.tt.displayLarge),
          ),
          toolbarHeight: 120,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: TabBar(
              tabs: tabs
                  .map(
                    (tab) => TabHeader(
                      text: tab.title,
                      indicatorValue: tab.indicatorValue,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        body: const SafeArea(
          top: false,
          child: TabBarView(
            children: [
              AilmentsTab(),
              TreatmentTab(),
            ],
          ),
        ),
      ),
    );
  }
}
